Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC80C282DA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64923222CC
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 18:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="QYIhIGKj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfDSSYF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:24:05 -0400
Received: from mail-eopbgr780059.outbound.protection.outlook.com ([40.107.78.59]:51660
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727606AbfDSSX7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmDiI9aq8mwlB20+3fExI+4gzKfKXScOrZtGhipPfzk=;
 b=QYIhIGKjLT9YJUxSQnEGhIyeZ9McPpvnmmkzKdxwIR4IscMLpknUPGHadMDofZLpO2ziSA5wo2W7PV+5Ovoj9VEB9nGYG2s3vWiGssKLr98XJAjhGwG4ei6o0erFqQjfZ9wXq555/cM1C2l4oF4EJ9QuAUed5NkZoUxH6/OysnQ=
Received: from BYAPR02MB5992.namprd02.prod.outlook.com (20.179.89.80) by
 BYAPR02MB4805.namprd02.prod.outlook.com (52.135.232.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.11; Fri, 19 Apr 2019 16:59:35 +0000
Received: from BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::75d3:6a86:7357:90bd]) by BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::75d3:6a86:7357:90bd%6]) with mapi id 15.20.1813.013; Fri, 19 Apr 2019
 16:59:35 +0000
From:   Jolly Shah <JOLLYS@xilinx.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH v3] clk: zynqmp: use structs for clk query responses
Thread-Topic: [PATCH v3] clk: zynqmp: use structs for clk query responses
Thread-Index: AQHU8RVzo6Bnhld52UOhpViGBBpWq6ZCYMJQgAFfXVA=
Date:   Fri, 19 Apr 2019 16:59:35 +0000
Message-ID: <BYAPR02MB59928B3FFC33A1A3DE0E9DACB8270@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190412095220.22855-1-m.tretter@pengutronix.de>
 <BYAPR02MB5992D239360C649F9CB0EB7EB8260@BYAPR02MB5992.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB5992D239360C649F9CB0EB7EB8260@BYAPR02MB5992.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JOLLYS@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94fbd3b0-1236-46a1-4a1e-08d6c4e866aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:BYAPR02MB4805;
x-ms-traffictypediagnostic: BYAPR02MB4805:
x-microsoft-antispam-prvs: <BYAPR02MB4805F41233238C166546E01CB8270@BYAPR02MB4805.namprd02.prod.outlook.com>
x-forefront-prvs: 0012E6D357
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(366004)(13464003)(189003)(199004)(316002)(5660300002)(107886003)(7696005)(53946003)(2201001)(3846002)(86362001)(6506007)(55016002)(6116002)(99286004)(6246003)(66946007)(33656002)(64756008)(73956011)(14454004)(53936002)(6436002)(66446008)(4326008)(76176011)(30864003)(256004)(102836004)(9686003)(2501003)(476003)(81156014)(229853002)(72206003)(8936002)(8676002)(11346002)(478600001)(71200400001)(71190400001)(446003)(66066001)(26005)(52536014)(25786009)(186003)(7736002)(74316002)(97736004)(305945005)(81166006)(110136005)(486006)(68736007)(54906003)(2906002)(53546011)(66476007)(76116006)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4805;H:BYAPR02MB5992.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g4AJwrQLvhWboCt0NPS3WwbKNmNJ5v+P+KpUHUAY0HBAhvpHOKcQcChqLDOX5vzCVu0Os6nH+PbIaJeDqstj7+Gu1uuAGLD7HEAnW+VOfVAWd5gKeZQHOQbrNSoRfKffFjLAEDYZg42ncePLRV+acctpCZKYRRLrOfvV0RG/vXEPj05tn1Y6l5vsMUOY+4Fxe/btNb0nsO9j62ICFq56cFojchWTKKYBLPRKbTILduIY6/Gkcfx0IfAkcvieQ4zERN5xr13vugbtxR556b5pqRAyUw+YR9rSVbiasG0nZ0x4a1Ra4wIyxZ+CwDCPioJhS5JnJhbRiFMY6NYnIv2az6vdawv3X+jKjRI0kx1Q8m1lciwqNN+5CXkFGsTTH5XeIo/oAVJ30aOWt90fXicqJt5TsGLwzzkruDeiQpf1oCQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fbd3b0-1236-46a1-4a1e-08d6c4e866aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2019 16:59:35.1855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4805
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With typo fix mentioned below,
Reviewed-by: Jolly Shah <jolly.shah@xilinx.com>

Thanks,
Jolly Shah


> -----Original Message-----
> From: Jolly Shah
> Sent: Thursday, April 18, 2019 1:02 PM
> To: Michael Tretter <m.tretter@pengutronix.de>; linux-clk@vger.kernel.org=
;
> linux-arm-kernel@lists.infradead.org
> Cc: kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> Stephen Boyd <sboyd@kernel.org>; Michal Simek <michals@xilinx.com>
> Subject: RE: [PATCH v3] clk: zynqmp: use structs for clk query responses
>=20
> Hi,
>=20
> > -----Original Message-----
> > From: Michael Tretter <m.tretter@pengutronix.de>
> > Sent: Friday, April 12, 2019 2:52 AM
> > To: linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Cc: kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> > Stephen Boyd <sboyd@kernel.org>; Michal Simek <michals@xilinx.com>; Jol=
ly
> > Shah <JOLLYS@xilinx.com>; Michael Tretter <m.tretter@pengutronix.de>
> > Subject: [PATCH v3] clk: zynqmp: use structs for clk query responses
> >
> > The driver retrieves the clock try by querying the ATF for the clock
>=20
> *tree
>=20
> Thanks,
> Jolly Shah
>=20
> > names, the clock topology, the parents and other attributes. The driver
> > needs to unmarshal the responses.
> >
> > The definition of the fields in the firmware responses to the queries i=
s
> > inconsistent. Some are specified as a mask, some as a shift, and by the
> > length of the previous field.
> >
> > Define C structs for the entire firmware responses to avoid passing
> > pointers to arrays of an implicit size and make the format of the
> > responses to the queries obvious.
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > v2 -> v3:
> > - fix conflicts with new format of get_attr response
> >
> > v1 -> v2:
> > - define structs for firmware responses
> > - fix size of CLK_TYPOLOGY_FLAGS
> > ---
> >  drivers/clk/zynqmp/clk-zynqmp.h |   6 --
> >  drivers/clk/zynqmp/clkc.c       | 170 +++++++++++++++++++-------------
> >  2 files changed, 99 insertions(+), 77 deletions(-)
> >
> > diff --git a/drivers/clk/zynqmp/clk-zynqmp.h b/drivers/clk/zynqmp/clk-
> zynqmp.h
> > index 7ab163b67249..fec9a15c8786 100644
> > --- a/drivers/clk/zynqmp/clk-zynqmp.h
> > +++ b/drivers/clk/zynqmp/clk-zynqmp.h
> > @@ -10,12 +10,6 @@
> >
> >  #include <linux/firmware/xlnx-zynqmp.h>
> >
> > -/* Clock APIs payload parameters */
> > -#define CLK_GET_NAME_RESP_LEN				16
> > -#define CLK_GET_TOPOLOGY_RESP_WORDS			3
> > -#define CLK_GET_PARENTS_RESP_WORDS			3
> > -#define CLK_GET_ATTR_RESP_WORDS				1
> > -
> >  enum topology_type {
> >  	TYPE_INVALID,
> >  	TYPE_MUX,
> > diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> > index 8b9d94a2e775..fb2dbd556f9e 100644
> > --- a/drivers/clk/zynqmp/clkc.c
> > +++ b/drivers/clk/zynqmp/clkc.c
> > @@ -21,24 +21,6 @@
> >  #define MAX_NODES			6
> >  #define MAX_NAME_LEN			50
> >
> > -#define CLK_TYPE_SHIFT			2
> > -
> > -#define PM_API_PAYLOAD_LEN		3
> > -
> > -#define NA_PARENT			0xFFFFFFFF
> > -#define DUMMY_PARENT			0xFFFFFFFE
> > -
> > -#define CLK_TYPE_FIELD_LEN		4
> > -#define CLK_TOPOLOGY_NODE_OFFSET	16
> > -#define NODES_PER_RESP			3
> > -
> > -#define CLK_TYPE_FIELD_MASK		0xF
> > -#define CLK_FLAG_FIELD_MASK		GENMASK(21, 8)
> > -#define CLK_TYPE_FLAG_FIELD_MASK	GENMASK(31, 24)
> > -
> > -#define CLK_PARENTS_ID_LEN		16
> > -#define CLK_PARENTS_ID_MASK		0xFFFF
> > -
> >  /* Flags for parents */
> >  #define PARENT_CLK_SELF			0
> >  #define PARENT_CLK_NODE1		1
> > @@ -52,11 +34,10 @@
> >  #define END_OF_PARENTS			1
> >  #define RESERVED_CLK_NAME		""
> >
> > -#define CLK_VALID_MASK			0x1
> > -#define NODE_CLASS_SHIFT		26U
> > -#define NODE_SUBCLASS_SHIFT		20U
> > -#define NODE_TYPE_SHIFT			14U
> > -#define NODE_INDEX_SHIFT		0U
> > +#define CLK_GET_NAME_RESP_LEN		16
> > +#define CLK_GET_TOPOLOGY_RESP_WORDS	3
> > +#define CLK_GET_PARENTS_RESP_WORDS	3
> > +#define CLK_GET_ATTR_RESP_WORDS		1
> >
> >  enum clk_type {
> >  	CLK_TYPE_OUTPUT,
> > @@ -97,6 +78,35 @@ struct zynqmp_clock {
> >  	u32 clk_id;
> >  };
> >
> > +struct name_resp {
> > +	char name[CLK_GET_NAME_RESP_LEN];
> > +};
> > +
> > +struct topology_resp {
> > +#define CLK_TOPOLOGY_TYPE		GENMASK(3, 0)
> > +#define CLK_TOPOLOGY_FLAGS		GENMASK(23, 8)
> > +#define CLK_TOPOLOGY_TYPE_FLAGS		GENMASK(31, 24)
> > +	u32 topology[CLK_GET_TOPOLOGY_RESP_WORDS];
> > +};
> > +
> > +struct parents_resp {
> > +#define NA_PARENT			0xFFFFFFFF
> > +#define DUMMY_PARENT			0xFFFFFFFE
> > +#define CLK_PARENTS_ID			GENMASK(15, 0)
> > +#define CLK_PARENTS_FLAGS		GENMASK(31, 16)
> > +	u32 parents[CLK_GET_PARENTS_RESP_WORDS];
> > +};
> > +
> > +struct attr_resp {
> > +#define CLK_ATTR_VALID			BIT(0)
> > +#define CLK_ATTR_TYPE			BIT(2)
> > +#define CLK_ATTR_NODE_INDEX		GENMASK(13, 0)
> > +#define CLK_ATTR_NODE_TYPE		GENMASK(19, 14)
> > +#define CLK_ATTR_NODE_SUBCLASS		GENMASK(25, 20)
> > +#define CLK_ATTR_NODE_CLASS		GENMASK(31, 26)
> > +	u32 attr[CLK_GET_ATTR_RESP_WORDS];
> > +};
> > +
> >  static const char clk_type_postfix[][10] =3D {
> >  	[TYPE_INVALID] =3D "",
> >  	[TYPE_MUX] =3D "_mux",
> > @@ -205,14 +215,15 @@ static int zynqmp_pm_clock_get_num_clocks(u32
> > *nclocks)
> >  /**
> >   * zynqmp_pm_clock_get_name() - Get the name of clock for given id
> >   * @clock_id:	ID of the clock to be queried
> > - * @name:	Name of given clock
> > + * @response:	Name of the clock with the given id
> >   *
> >   * This function is used to get name of clock specified by given
> >   * clock ID.
> >   *
> > - * Return: Returns 0, in case of error name would be 0
> > + * Return: Returns 0
> >   */
> > -static int zynqmp_pm_clock_get_name(u32 clock_id, char *name)
> > +static int zynqmp_pm_clock_get_name(u32 clock_id,
> > +				    struct name_resp *response)
> >  {
> >  	struct zynqmp_pm_query_data qdata =3D {0};
> >  	u32 ret_payload[PAYLOAD_ARG_CNT];
> > @@ -221,7 +232,7 @@ static int zynqmp_pm_clock_get_name(u32 clock_id,
> > char *name)
> >  	qdata.arg1 =3D clock_id;
> >
> >  	eemi_ops->query_data(qdata, ret_payload);
> > -	memcpy(name, ret_payload, CLK_GET_NAME_RESP_LEN);
> > +	memcpy(response, ret_payload, sizeof(*response));
> >
> >  	return 0;
> >  }
> > @@ -230,7 +241,7 @@ static int zynqmp_pm_clock_get_name(u32 clock_id,
> > char *name)
> >   * zynqmp_pm_clock_get_topology() - Get the topology of clock for give=
n id
> >   * @clock_id:	ID of the clock to be queried
> >   * @index:	Node index of clock topology
> > - * @topology:	Buffer to store nodes in topology and flags
> > + * @response:	Buffer used for the topology response
> >   *
> >   * This function is used to get topology information for the clock
> >   * specified by given clock ID.
> > @@ -243,7 +254,8 @@ static int zynqmp_pm_clock_get_name(u32 clock_id,
> > char *name)
> >   *
> >   * Return: 0 on success else error+reason
> >   */
> > -static int zynqmp_pm_clock_get_topology(u32 clock_id, u32 index, u32
> > *topology)
> > +static int zynqmp_pm_clock_get_topology(u32 clock_id, u32 index,
> > +					struct topology_resp *response)
> >  {
> >  	struct zynqmp_pm_query_data qdata =3D {0};
> >  	u32 ret_payload[PAYLOAD_ARG_CNT];
> > @@ -254,7 +266,7 @@ static int zynqmp_pm_clock_get_topology(u32
> clock_id,
> > u32 index, u32 *topology)
> >  	qdata.arg2 =3D index;
> >
> >  	ret =3D eemi_ops->query_data(qdata, ret_payload);
> > -	memcpy(topology, &ret_payload[1],
> > CLK_GET_TOPOLOGY_RESP_WORDS * 4);
> > +	memcpy(response, &ret_payload[1], sizeof(*response));
> >
> >  	return ret;
> >  }
> > @@ -303,7 +315,7 @@ struct clk_hw
> *zynqmp_clk_register_fixed_factor(const
> > char *name, u32 clk_id,
> >   * zynqmp_pm_clock_get_parents() - Get the first 3 parents of clock fo=
r given
> id
> >   * @clock_id:	Clock ID
> >   * @index:	Parent index
> > - * @parents:	3 parents of the given clock
> > + * @response:	Parents of the given clock
> >   *
> >   * This function is used to get 3 parents for the clock specified by
> >   * given clock ID.
> > @@ -316,7 +328,8 @@ struct clk_hw
> *zynqmp_clk_register_fixed_factor(const
> > char *name, u32 clk_id,
> >   *
> >   * Return: 0 on success else error+reason
> >   */
> > -static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index, u32
> > *parents)
> > +static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index,
> > +				       struct parents_resp *response)
> >  {
> >  	struct zynqmp_pm_query_data qdata =3D {0};
> >  	u32 ret_payload[PAYLOAD_ARG_CNT];
> > @@ -327,7 +340,7 @@ static int zynqmp_pm_clock_get_parents(u32
> clock_id,
> > u32 index, u32 *parents)
> >  	qdata.arg2 =3D index;
> >
> >  	ret =3D eemi_ops->query_data(qdata, ret_payload);
> > -	memcpy(parents, &ret_payload[1], CLK_GET_PARENTS_RESP_WORDS *
> > 4);
> > +	memcpy(response, &ret_payload[1], sizeof(*response));
> >
> >  	return ret;
> >  }
> > @@ -335,13 +348,14 @@ static int zynqmp_pm_clock_get_parents(u32
> > clock_id, u32 index, u32 *parents)
> >  /**
> >   * zynqmp_pm_clock_get_attributes() - Get the attributes of clock for =
given id
> >   * @clock_id:	Clock ID
> > - * @attr:	Clock attributes
> > + * @response:	Clock attributes response
> >   *
> >   * This function is used to get clock's attributes(e.g. valid, clock t=
ype, etc).
> >   *
> >   * Return: 0 on success else error+reason
> >   */
> > -static int zynqmp_pm_clock_get_attributes(u32 clock_id, u32 *attr)
> > +static int zynqmp_pm_clock_get_attributes(u32 clock_id,
> > +					  struct attr_resp *response)
> >  {
> >  	struct zynqmp_pm_query_data qdata =3D {0};
> >  	u32 ret_payload[PAYLOAD_ARG_CNT];
> > @@ -351,7 +365,7 @@ static int zynqmp_pm_clock_get_attributes(u32
> > clock_id, u32 *attr)
> >  	qdata.arg1 =3D clock_id;
> >
> >  	ret =3D eemi_ops->query_data(qdata, ret_payload);
> > -	memcpy(attr, &ret_payload[1], CLK_GET_ATTR_RESP_WORDS * 4);
> > +	memcpy(response, &ret_payload[1], sizeof(*response));
> >
> >  	return ret;
> >  }
> > @@ -360,24 +374,28 @@ static int zynqmp_pm_clock_get_attributes(u32
> > clock_id, u32 *attr)
> >   * __zynqmp_clock_get_topology() - Get topology data of clock from
> firmware
> >   *				   response data
> >   * @topology:		Clock topology
> > - * @data:		Clock topology data received from firmware
> > + * @response:		Clock topology data received from firmware
> >   * @nnodes:		Number of nodes
> >   *
> >   * Return: 0 on success else error+reason
> >   */
> >  static int __zynqmp_clock_get_topology(struct clock_topology *topology=
,
> > -				       u32 *data, u32 *nnodes)
> > +				       struct topology_resp *response,
> > +				       u32 *nnodes)
> >  {
> >  	int i;
> > +	u32 type;
> >
> > -	for (i =3D 0; i < PM_API_PAYLOAD_LEN; i++) {
> > -		if (!(data[i] & CLK_TYPE_FIELD_MASK))
> > +	for (i =3D 0; i < ARRAY_SIZE(response->topology); i++) {
> > +		type =3D FIELD_GET(CLK_TOPOLOGY_TYPE, response-
> > >topology[i]);
> > +		if (type =3D=3D TYPE_INVALID)
> >  			return END_OF_TOPOLOGY_NODE;
> > -		topology[*nnodes].type =3D data[i] & CLK_TYPE_FIELD_MASK;
> > -		topology[*nnodes].flag =3D FIELD_GET(CLK_FLAG_FIELD_MASK,
> > -						   data[i]);
> > +		topology[*nnodes].type =3D type;
> > +		topology[*nnodes].flag =3D FIELD_GET(CLK_TOPOLOGY_FLAGS,
> > +						   response->topology[i]);
> >  		topology[*nnodes].type_flag =3D
> > -				FIELD_GET(CLK_TYPE_FLAG_FIELD_MASK,
> > data[i]);
> > +				FIELD_GET(CLK_TOPOLOGY_TYPE_FLAGS,
> > +					  response->topology[i]);
> >  		(*nnodes)++;
> >  	}
> >
> > @@ -398,15 +416,16 @@ static int zynqmp_clock_get_topology(u32 clk_id,
> >  				     u32 *num_nodes)
> >  {
> >  	int j, ret;
> > -	u32 pm_resp[PM_API_PAYLOAD_LEN] =3D {0};
> > +	struct topology_resp response =3D {0};
> >
> >  	*num_nodes =3D 0;
> > -	for (j =3D 0; j <=3D MAX_NODES; j +=3D 3) {
> > +	for (j =3D 0; j <=3D MAX_NODES; j +=3D ARRAY_SIZE(response.topology))=
 {
> >  		ret =3D zynqmp_pm_clock_get_topology(clock[clk_id].clk_id, j,
> > -						   pm_resp);
> > +						   &response);
> >  		if (ret)
> >  			return ret;
> > -		ret =3D __zynqmp_clock_get_topology(topology, pm_resp,
> > num_nodes);
> > +		ret =3D __zynqmp_clock_get_topology(topology, &response,
> > +						  num_nodes);
> >  		if (ret =3D=3D END_OF_TOPOLOGY_NODE)
> >  			return 0;
> >  	}
> > @@ -418,28 +437,30 @@ static int zynqmp_clock_get_topology(u32 clk_id,
> >   * __zynqmp_clock_get_parents() - Get parents info of clock from firmw=
are
> >   *				   response data
> >   * @parents:		Clock parents
> > - * @data:		Clock parents data received from firmware
> > + * @response:		Clock parents data received from firmware
> >   * @nparent:		Number of parent
> >   *
> >   * Return: 0 on success else error+reason
> >   */
> > -static int __zynqmp_clock_get_parents(struct clock_parent *parents, u3=
2
> > *data,
> > +static int __zynqmp_clock_get_parents(struct clock_parent *parents,
> > +				      struct parents_resp *response,
> >  				      u32 *nparent)
> >  {
> >  	int i;
> >  	struct clock_parent *parent;
> >
> > -	for (i =3D 0; i < PM_API_PAYLOAD_LEN; i++) {
> > -		if (data[i] =3D=3D NA_PARENT)
> > +	for (i =3D 0; i < ARRAY_SIZE(response->parents); i++) {
> > +		if (response->parents[i] =3D=3D NA_PARENT)
> >  			return END_OF_PARENTS;
> >
> >  		parent =3D &parents[i];
> > -		parent->id =3D data[i] & CLK_PARENTS_ID_MASK;
> > -		if (data[i] =3D=3D DUMMY_PARENT) {
> > +		parent->id =3D FIELD_GET(CLK_PARENTS_ID, response-
> > >parents[i]);
> > +		if (response->parents[i] =3D=3D DUMMY_PARENT) {
> >  			strcpy(parent->name, "dummy_name");
> >  			parent->flag =3D 0;
> >  		} else {
> > -			parent->flag =3D data[i] >> CLK_PARENTS_ID_LEN;
> > +			parent->flag =3D FIELD_GET(CLK_PARENTS_FLAGS,
> > +						 response->parents[i]);
> >  			if (zynqmp_get_clock_name(parent->id, parent-
> > >name))
> >  				continue;
> >  		}
> > @@ -461,21 +482,21 @@ static int zynqmp_clock_get_parents(u32 clk_id,
> > struct clock_parent *parents,
> >  				    u32 *num_parents)
> >  {
> >  	int j =3D 0, ret;
> > -	u32 pm_resp[PM_API_PAYLOAD_LEN] =3D {0};
> > +	struct parents_resp response =3D {0};
> >
> >  	*num_parents =3D 0;
> >  	do {
> >  		/* Get parents from firmware */
> >  		ret =3D zynqmp_pm_clock_get_parents(clock[clk_id].clk_id, j,
> > -						  pm_resp);
> > +						  &response);
> >  		if (ret)
> >  			return ret;
> >
> > -		ret =3D __zynqmp_clock_get_parents(&parents[j], pm_resp,
> > +		ret =3D __zynqmp_clock_get_parents(&parents[j], &response,
> >  						 num_parents);
> >  		if (ret =3D=3D END_OF_PARENTS)
> >  			return 0;
> > -		j +=3D PM_API_PAYLOAD_LEN;
> > +		j +=3D ARRAY_SIZE(response.parents);
> >  	} while (*num_parents <=3D MAX_PARENT);
> >
> >  	return 0;
> > @@ -631,26 +652,33 @@ static int zynqmp_register_clocks(struct
> device_node
> > *np)
> >  static void zynqmp_get_clock_info(void)
> >  {
> >  	int i, ret;
> > -	u32 attr, type =3D 0, nodetype, subclass, class;
> > +	u32 type =3D 0;
> > +	u32 nodetype, subclass, class;
> > +	struct attr_resp attr;
> > +	struct name_resp name;
> >
> >  	for (i =3D 0; i < clock_max_idx; i++) {
> >  		ret =3D zynqmp_pm_clock_get_attributes(i, &attr);
> >  		if (ret)
> >  			continue;
> >
> > -		clock[i].valid =3D attr & CLK_VALID_MASK;
> > -		clock[i].type =3D ((attr >> CLK_TYPE_SHIFT) & 0x1) ?
> > -				CLK_TYPE_EXTERNAL : CLK_TYPE_OUTPUT;
> > -		nodetype =3D (attr >> NODE_TYPE_SHIFT) & 0x3F;
> > -		subclass =3D (attr >> NODE_SUBCLASS_SHIFT) & 0x3F;
> > -		class =3D (attr >> NODE_CLASS_SHIFT) & 0x3F;
> > +		clock[i].valid =3D FIELD_GET(CLK_ATTR_VALID, attr.attr[0]);
> > +		clock[i].type =3D FIELD_GET(CLK_ATTR_TYPE, attr.attr[0]) ?
> > +			CLK_TYPE_EXTERNAL : CLK_TYPE_OUTPUT;
> >
> > -		clock[i].clk_id =3D (class << NODE_CLASS_SHIFT) |
> > -				  (subclass << NODE_SUBCLASS_SHIFT) |
> > -				  (nodetype << NODE_TYPE_SHIFT) |
> > -				  (i << NODE_INDEX_SHIFT);
> > +		nodetype =3D FIELD_GET(CLK_ATTR_NODE_TYPE, attr.attr[0]);
> > +		subclass =3D FIELD_GET(CLK_ATTR_NODE_SUBCLASS,
> > attr.attr[0]);
> > +		class =3D FIELD_GET(CLK_ATTR_NODE_CLASS, attr.attr[0]);
> >
> > -		zynqmp_pm_clock_get_name(clock[i].clk_id,
> > clock[i].clk_name);
> > +		clock[i].clk_id =3D FIELD_PREP(CLK_ATTR_NODE_CLASS, class) |
> > +				  FIELD_PREP(CLK_ATTR_NODE_SUBCLASS,
> > subclass) |
> > +				  FIELD_PREP(CLK_ATTR_NODE_TYPE,
> > nodetype) |
> > +				  FIELD_PREP(CLK_ATTR_NODE_INDEX, i);
> > +
> > +		zynqmp_pm_clock_get_name(clock[i].clk_id, &name);
> > +		if (!strcmp(name.name, RESERVED_CLK_NAME))
> > +			continue;
> > +		strncpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
> >  	}
> >
> >  	/* Get topology of all clock */
> > --
> > 2.20.1

