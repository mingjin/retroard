var Board = (function() {
    function Board(sectionIds) {

        this.sections = [];
        for (var i in sectionIds) {
            this.sections.push(new Section(sectionIds[i]));
        }

        this.history = new History();
    }

    Board.prototype.initialize = function() {
        this.history.initialize();
        StickyDialog.initialize();
        Connection.initialize();
        Listener.initialize(this);
    }

    Board.prototype.getSection = function(name) {
        for (var index in this.sections) {
            if(this.sections[index].name == name) {
                return this.sections[index];
            }
        }
    }

    return Board;
})();