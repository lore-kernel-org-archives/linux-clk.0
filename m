Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2653537F1
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644850; cv=pass; b=BsuFSRc5emaswZVDZke0n79Sm2rjd+ZaBB81thAVnM2q3qdiJY0KHSb9dtvWPbAqAls7NBSHVTcNBgWQ1xiJGzC0KG6GQ3bjfcwQsWjljh4pBIcIoV1y4IZgrwHXZM779yabmW3n5k9SR7OJkGKLs8MI4Z4Rd0Y5sxAyRZp08y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644850; c=relaxed/simple;
	bh=JhXUbAmc4eEDPKk8ugB/b+4DY0/aYbzevBnTQP/qoLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgIVisqCAvyROpJnoTqSPeeL1/KYlzAicbo2Y+LCzQNaJ5Fm1U8YFgEuK4Bstsd8dg9MwyfdKepMW+qKyWEvhX93U4vpTkT+qWbOK2WKl8vvRa1Q0t2M8RqkdU94qOW4fdtHgLblp2fB5hbUJdNOMrQQLKoeQdy2aoZSjAYtilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW245yiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GewTwvPF; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW245yiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GewTwvPF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P72A4x1228074
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=hW245yiuzPpw7Zc7
	TgI5VNmqUcEW+F7q3OTTfJAr9m+I8U+Mi99eCl1qdFtPN2dzojQ3waErOzZM/SV4
	raw/gVvUm3SlExnqFleFA4w3we4B3eHvab/tWFLtTjSZXJfySDZ1DKqwOkHzrh9y
	+zGcn1Vz17mWFL/hvjpDHkwGf9jZMNi6GCRKAaTJ6aUKu4tlA37r3CBEXy+uI1BU
	nO9dfrLc6QhISS+yH/aHgJt0l/HNqwUSn0YC5a4QhIYZwS6zr9RomQjt9CEwUj1f
	SE7xuEoZrCDNPmc33MonGrwEmaAcBQyGQD4H94PSwHSRoxoysR8Tr3DQYjQOiUNi
	/Hr+0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abr7h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:00:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso6685591a91.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 01:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787644845; cv=none;
        d=google.com; s=arc-20260327;
        b=DerD46QHVFxKTOTnJg1uB9m+tiHrEMNcENZJFSRoNPeDBolnIobWMZ8MCTC73agqLS
         2ONlItN7sA8N4Xuv2VDIEmss91w7mw52dqMN75R3n1kQLCa/gPJmvP83Dx4l4S/q+JEw
         IITx1WQVXy+tFn8+XGB6yF2TyTdbOncH3XhW7iE5kLvpsnfmxkwGebbmm1STAx4auuYJ
         2zHkATCVWx0RoP6bNRhmjnxqdEiVVppOI4H9PuCW5/YdrApHbuEm+T2/8dlAH0VDalBQ
         iQIzAZ29ojupzGpNt/18NMprnXTRV/Uzd15tsWVPTvbtWVcdXxbM7ZD46WIjVVW/N2q9
         peEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        fh=JAtl/VAgzVMdmheHlBtr2dfU1UPqQ05MC1HdAk5l3F4=;
        b=sjEd0cBh/sxzZETUf3kIuOBCJR2CbAHO6cg+QhuUwB8uMdL9iBYZmRp1d0s9Mfdybc
         xuyxmQh5sFjfOqyR2pdwFQ52EMbFLICJB2YnW9CrGiSwoBIEkuhlcpYNrrNYIb+dhRRf
         oqcUqn9OBfYMzbXQ0i+R0e4PiQoA9w9Vw/FPfiSchbLMMcLlgYrqxW61UXI4vlX5ss65
         Xp+eM8zad3+uFbENY5s3fD0n0Uprsmf2LR9Kjw3JL6D9Z9+YtsM1H6RWdgdMIcmJ5DVm
         OSkMG3K8ffMUafxfJnzL/rMNh+cvu73ncgHBHtCkIuUKuq976kODg8rid9UQFs6McYmB
         rX2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644845; x=1788249645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=GewTwvPFlKrf0UqljTYPAhJVWzr6rL+EIGiL/M8X14z8dWB6YWOrf3nJxqMHWt1HrQ
         NQsSeQj920y8jhB0C50MQr+1YtPZshwVCyEQGMkvTEBrIwQfpb1UDKBmBlAlSTGbP44M
         AgF8hfuauTGUQIT3+U3QIkHDJf+dYO0Qny4ET/yQw/7Jm5FPQexBjGqDDEfhZvfk1Eka
         +vPa+a0QdhBl4zE2QHq2nNjvYOM0KBdhPMQOp8KZNTTKzCwtUnhS9hNUfPmoz2Z1bjw0
         /T9sKl2CXtD3REpXmYpmtg2N0IiYkDnrZ8wpKnunZRyORYBGTreF0VaU8SLnDuYNcwZO
         Q6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644845; x=1788249645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=MafYsdw0nJdtPYHIP9X2MH/7ifsMtXrQaEExFSteJilBvSaeHwn8ksb+epZaAjrauT
         ps+0PaEmxAkF9MFn81K2S08KrpxiEGNEuzK17483zKznmtXKzlRJEqceUrUGA+jxdvY6
         NCqDYhqeYLauH2HTCsFcsb6XgQQthWG0KB6HJKG11EuPzbzrn185DJwJqiWHAtKU/RbV
         0cbVWlbFuFVz3k/ZLxGB/SxXXZ8lzUAQPwS0jlimv/+7OQRcarKNfM5UbWZEfX+QbFX4
         gGEvfccgCATAdaRcWLOiGVPiTb2uUydJQUnAyF+D+w5A2rcmRDw918v99ar1eN3Glzhy
         3nNA==
X-Forwarded-Encrypted: i=1; AHgh+RrNWJXFtWRm9M1i4mHP4jOpxnlEsDH6lu/aPdr4lZoJ8xp1i69HcYH0MS8A+NslUxhjs97U6flktuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mOjX52a6mAx0oKckBc0suDU2q/SRWEeSZmo+c7uEb4A7De/ykn
	9hmfYR69Zvk594zoC82HKconQ/98+EZeDxf6ktzAa2z5hIoslbgucqvNodu7+KETK6J1wTROKb+
	mgFbnI6+nNFPiRO4MjoFksL1WzRyRyIS40DKS3wfitWYl8NE6gDi5GUNKsDdOE42mCWT2mUL3/W
	4TqoQSuMStImjE21DQfkz+hd+zaEB0zacJfsFFJA==
X-Gm-Gg: AR+sD12WYk71cwuYW4sNlDlzWZXbaNGBqih3eiaYoDuhaBZgoJsdBcpa5oURdC908hR
	xGEC7GUsod8x7DLoyQ/EzIVIRE+jliqObZdvWDsA6hKRZdxOhTjwqcYcIWtyzG9Q/NGej7i0NYe
	GHxk9NIAyfyVy1LSd5KKk5PMVLXr2xt8DpYHd/fSYlP7aWMlU3MDYwNOHcjA==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr54366323a91.4.1787644844877;
        Tue, 25 Aug 2026 01:00:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-395c3367376mr54366138a91.4.1787644844301; Tue, 25 Aug 2026
 01:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:00:32 +0200
X-Gm-Features: AcwNN1WaGLEXokEDN-w-P7YAI63J28S_AjYowYxFfZoRRRkDa1AUJBYrsKRUG74
Message-ID: <CAPx+jO9LSfy6-3Gb1+0RvHeVeU9dAN+-1jcGaCESpTZXEAE_YQ@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX92jHrkF3AMJL
 g20fWNQ24XEss2IU/lqtt4Y/2sTbH0iVAtaMzioktki4LutJT4o9FL3SvI0WzQslEENh1a1Sl3G
 d4xN+7YCqHTRxnxL4WGBktHqEYxBHDE2l/ma99o0rVYBW0MGlENf4sBmZwgXlZG6+PFuJepdfGq
 KiEENQh8z3vjkq2b1Cyi7pXasfx4zKUNum9NVZLhb5BPR4JcrL4oyHRGnf5cvDyUAIxe5oGK3MB
 Qmn4pPMeQF65SXT04hZukCQLAlwhVzEc3lx+dYk9btLOiwt+trexBnjaPBHqKPIh1VwSDZ2FbvR
 Gi0eykj1IDmXf1817Bh6CINK/UHmve4q14tw2QkgCV+9k0juF4p8yUNyiPPIUEayx4b//LGG06j
 STNMqRPEEutJkxPjHMwwg+J5fhapR+JgaSuecuuxh6brwgeue443WegVe0g3KxAXMinzhqbB+fs
 G38tRPM95DOlcKlGhVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX30EN6DU8ZR8L
 Y91oEcwRh0Wr7yM6CB/T2ypLPfksMqonSVyrdEYyPhc9FctA4VxQsLvbPvbVIxowgmeitwvyF08
 1Tu+k32DK2PJt5VxzJrCI8i72pxMWP4=
X-Proofpoint-GUID: oN63RcfXe8708qxN2u-9YdLELxbMFUB4
X-Proofpoint-ORIG-GUID: oN63RcfXe8708qxN2u-9YdLELxbMFUB4
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d4bae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=xsHTnWN7LAWtonkW0D4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250067

On Fri, Aug 21, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> Compile-tested only.
> ---
>  drivers/clk/ux500/clk-prcc.c    | 2 +-
>  drivers/clk/ux500/clk-prcmu.c   | 4 ++--
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcc.c b/drivers/clk/ux500/clk-prcc.c
> index dce235df2576dfb2..dde72d2fd0ac67ae 100644
> --- a/drivers/clk/ux500/clk-prcc.c
> +++ b/drivers/clk/ux500/clk-prcc.c
> @@ -97,8 +97,8 @@ static struct clk *clk_reg_prcc(const char *name,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_prcc_ops)
>  {
> +       struct clk_init_data clk_prcc_init =3D {};
>         struct clk_prcc *clk;
> -       struct clk_init_data clk_prcc_init;
>         struct clk *clk_reg;
>
>         if (!name) {
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.=
c
> index ac96c46bd1bbf76b..d89f3b634f8bbd26 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -200,8 +200,8 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
>                                     unsigned long flags,
>                                     const struct clk_ops *clk_prcmu_ops)
>  {
> +       struct clk_init_data clk_prcmu_init =3D {};
>         struct clk_prcmu *clk;
> -       struct clk_init_data clk_prcmu_init;
>         int ret;
>
>         if (!name) {
> @@ -357,8 +357,8 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
>                                     u8 source, u8 divider)
>
>  {
> +       struct clk_init_data clk_prcmu_clkout_init =3D {};
>         struct clk_prcmu_clkout *clk;
> -       struct clk_init_data clk_prcmu_clkout_init;
>         u8 clkout_id;
>         int ret;
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysc=
trl.c
> index ba3258c88d28e101..2127a949e56ccf27 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -127,8 +127,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev=
,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_sysctrl_ops)
>  {
> +       struct clk_init_data clk_sysctrl_init =3D {};
>         struct clk_sysctrl *clk;
> -       struct clk_init_data clk_sysctrl_init;
>         struct clk *clk_reg;
>         int i;
>
> --
> 2.43.0
>
