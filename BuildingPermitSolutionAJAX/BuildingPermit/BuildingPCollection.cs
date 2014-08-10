namespace BuildingPermit
{
    #region

    using System.Collections.Generic;

    #endregion

    public class BuildingPCollection
    {
        #region Constructors and Destructors

        public BuildingPCollection()
        {
            this.BuildingPList = new List<BuildingP>();
        }

        #endregion

        #region Public Properties

        public List<BuildingP> BuildingPList { get; set; }

        #endregion
    }
}