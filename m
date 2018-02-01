Return-Path: <pdeschrijver@nvidia.com>
Date: Thu, 1 Feb 2018 12:30:02 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/6] clk: tegra: DT align parameter for CVB calculation
Message-ID: <20180201103002.GY7031@tbergstrom-lnx.Nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-4-git-send-email-pdeschrijver@nvidia.com>
 <7066d1ff-6da4-203d-57ea-cf179fea17be@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <7066d1ff-6da4-203d-57ea-cf179fea17be@nvidia.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 31, 2018 at 10:43:04AM +0000, Jon Hunter wrote:
>=20
> On 24/01/18 12:45, Peter De Schrijver wrote:
> > When using a PWM controlled regulator, the voltage step and offset are
> > determined by the regulator IC in use. This is specified in DT rather
> > than fixed in the CVB table. Hence pass this information to the CVB tab=
le
> > calculation function. For backwards compatibility the table values are =
used
> > if the corresponding parameter is 0.
> >=20
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 23 +++++++++++++++++++++-=
-
> >  drivers/clk/tegra/cvb.c                    | 18 ++++++++++++++----
> >  drivers/clk/tegra/cvb.h                    |  5 +++--
> >  3 files changed, 38 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/t=
egra/clk-tegra124-dfll-fcpu.c
> > index 440eb8d..6205ce1 100644
> > --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> > +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> > @@ -111,6 +111,7 @@ static int tegra124_dfll_fcpu_probe(struct platform=
_device *pdev)
> >  	struct tegra_dfll_soc_data *soc;
> >  	const struct of_device_id *of_id;
> >  	const struct dfll_fcpu_data *fcpu_data;
> > +	struct rail_alignment align;
> > =20
> >  	of_id =3D of_match_device(tegra124_dfll_fcpu_of_match, &pdev->dev);
> >  	fcpu_data =3D of_id->data;
> > @@ -135,12 +136,30 @@ static int tegra124_dfll_fcpu_probe(struct platfo=
rm_device *pdev)
> >  		return -ENODEV;
> >  	}
> > =20
> > +	err =3D of_property_read_u32(pdev->dev.of_node, "nvidia,align-offset-=
uv",
> > +					&align.offset_uv);
> > +	if (err < 0) {
> > +		dev_err(&pdev->dev,
> > +			"offset uv not found, default to table value\n");
> > +		align.offset_uv =3D 0;
> > +	}
> > +
> > +	err =3D of_property_read_u32(pdev->dev.of_node, "nvidia,align-step-uv=
",
> > +					&align.step_uv);
> > +	if (err < 0) {
> > +		dev_err(&pdev->dev,
> > +			"step uv not found, default to table value\n");
> > +		align.step_uv =3D 0;
> > +	}
> > +
>=20
> I am a bit confused by this ...
>=20
> 1. Isn't this going to break Tegra124 DFLL support?

We fall back to the original behaviour in case the properties are missing, =
so
it should work.

> 2. These DT properties are not defined anywhere (so the binding doc
>    needs updating).
> 3. I don't see any patches in this series that populate these properties
>    in DT.
>=20
> So I am not sure how this works?!?
>=20

The DT updates are indeed missing.

> >  	soc->max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
> > =20
> >  	soc->cvb =3D tegra_cvb_add_opp_table(soc->dev, fcpu_data->cpu_cvb_tab=
les,
> >  					   fcpu_data->cpu_cvb_tables_size,
> > -					   process_id, speedo_id, speedo_value,
> > -					   soc->max_freq);
> > +					   &align, process_id, speedo_id,
> > +					   speedo_value, soc->max_freq);
> > +	soc->alignment =3D align;
> > +
>=20
> This is not defined yet and so breaks compile.
>=20
> drivers/clk/tegra/clk-tegra124-dfll-fcpu.c: In function
> =E2=80=98tegra124_dfll_fcpu_probe=E2=80=99:
> drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:161:5: error: =E2=80=98struct
> tegra_dfll_soc_data=E2=80=99 has no member named =E2=80=98alignment=E2=80=
=99
>   soc->alignment =3D align;
>      ^
>=20
> What about Tegra124? This is set to NULL? Can we not set this before

It's a struct copy, not a pointer. And both values in the struct will indee=
d
be set to 0 then.

> calling tegra_cvb_add_opp_table() and then just pass soc->alignment for
> both Tegra124 and Tegra210? Then you can avoid the if-statements in
> build_opp_table.
>=20

The table to be used is determined by tegra_cvb_add_opp_table() based on sp=
eedo
and process ID. So this logic would have to be duplicated in
tegra124_dfll_fcpu_probe() then. In retrospect it was probably a mistake to
put these regulator parameters in the CVB table, but I think we're stuck
with this unless we want to force people to also update their DT.

> >  	if (IS_ERR(soc->cvb)) {
> >  		dev_err(&pdev->dev, "couldn't add OPP table: %ld\n",
> >  			PTR_ERR(soc->cvb));
> > diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
> > index da9e8e7..561012a 100644
> > --- a/drivers/clk/tegra/cvb.c
> > +++ b/drivers/clk/tegra/cvb.c
> > @@ -62,11 +62,19 @@ static int round_voltage(int mv, const struct rail_=
alignment *align, int up)
> >  }
> > =20
> >  static int build_opp_table(struct device *dev, const struct cvb_table =
*table,
> > +			   struct rail_alignment *align,
> >  			   int speedo_value, unsigned long max_freq)
> >  {
> > -	const struct rail_alignment *align =3D &table->alignment;
> >  	int i, ret, dfll_mv, min_mv, max_mv;
> > =20
> > +	if (!align->step_uv)
> > +		align->step_uv =3D table->alignment.step_uv;
> > +	if (!align->step_uv)
> > +		return -EINVAL;
> > +
> > +	if (!align->offset_uv)
> > +		align->offset_uv =3D table->alignment.offset_uv;
> > +
> >  	min_mv =3D round_voltage(table->min_millivolts, align, UP);
> >  	max_mv =3D round_voltage(table->max_millivolts, align, DOWN);
> > =20
> > @@ -109,8 +117,9 @@ static int build_opp_table(struct device *dev, cons=
t struct cvb_table *table,
> >   */
> >  const struct cvb_table *
> >  tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *ta=
bles,
> > -			size_t count, int process_id, int speedo_id,
> > -			int speedo_value, unsigned long max_freq)
> > +			size_t count, struct rail_alignment *align,
> > +			int process_id, int speedo_id, int speedo_value,
> > +			unsigned long max_freq)
> >  {
> >  	size_t i;
> >  	int ret;
> > @@ -124,7 +133,8 @@ static int build_opp_table(struct device *dev, cons=
t struct cvb_table *table,
> >  		if (table->process_id !=3D -1 && table->process_id !=3D process_id)
> >  			continue;
> > =20
> > -		ret =3D build_opp_table(dev, table, speedo_value, max_freq);
> > +		ret =3D build_opp_table(dev, table, align, speedo_value,
> > +				      max_freq);
> >  		return ret ? ERR_PTR(ret) : table;
> >  	}
> > =20
> > diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
> > index c1f0779..cfa110f 100644
> > --- a/drivers/clk/tegra/cvb.h
> > +++ b/drivers/clk/tegra/cvb.h
> > @@ -59,8 +59,9 @@ struct cvb_table {
> > =20
> >  const struct cvb_table *
> >  tegra_cvb_add_opp_table(struct device *dev, const struct cvb_table *cv=
b_tables,
> > -			size_t count, int process_id, int speedo_id,
> > -			int speedo_value, unsigned long max_freq);
> > +			size_t count, struct rail_alignment *align,
> > +			int process_id, int speedo_id, int speedo_value,
> > +			unsigned long max_freq);
> >  void tegra_cvb_remove_opp_table(struct device *dev,
> >  				const struct cvb_table *table,
> >  				unsigned long max_freq);
> >=20
>=20
> Cheers
> Jon
>=20
> --=20
> nvpublic
