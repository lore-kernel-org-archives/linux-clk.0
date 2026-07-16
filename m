Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D941D633
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202935; cv=pass; b=DSZgFA+ssyhAMI8X9u7nPodw8p3DO946euOHaBS+CHA2RgFr3ZSsnUVPEVGvAMVFNNhTFfZRIdm5d9CXQkujqYUMUr/b3gkCC9FRZ6gUrqmyBHumey3Byw9lYXaURgT+aVs6H2nx1aNT5B51/An5x8VIVU+oLxVR/O8ZY4sosCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202935; c=relaxed/simple;
	bh=C96NzncbsQ/25PKJxsR427vDtbfGh0/AwS/xdfMx8Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mk1V2+ieWxSw60tgul7q4H5Unvl8JzsQ9tQZOGotTzXleDZrmntTbZMaCa7wPwlgwqWte5fw8OBMchcG77y7GRiboHZofJkfB5GmgIIQchtLY/GWxcAbxBnA9kn/dv6smNDnqD61EvUoHNadcsS6pkWy/HkHTn2Bk4Kg+iH8O1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiudG+I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYfDUPas; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiudG+I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYfDUPas"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiYCW2518695
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=; b=YiudG+I2F1ZQxgZx
	4N6qfruU4OF2hA2wyVxhqfkKGvoLahO1KV2unqq18ca4FbN3VGsj3H26W7oPmV/r
	ntAgChfzQk8iH5qx5Il3dsmmMpD7n8bfyUw+XS/wCDAG7+xex4m6iVcoswaK3G1w
	gfaxppW5UM9uxEM0IMir5GZjLaH6hyYlrbspV/+fBLCzZtGqhlXJY1eG54nDCY7m
	AXCPgby3moriOiMOcF7ijZIKXpMMhEmPnSKlBNIfku2dWVJJKnvjTJPp4ijQ7f+n
	r/RnCcHfZY/MWXhgHHO8pkBzZ2qYiliIZFbaMBgfbIjmVkP9uBas28d//K25ES5l
	PFavxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0n00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:55:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e4ba1cfabso41719291cf.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784202930; cv=none;
        d=google.com; s=arc-20260327;
        b=Ur++gAE9hHYdmrKYx9Q1i5WiyrkqsNVhIVU1J5iznucDkjUE/n2ouNtK6sA4BPLBLI
         9aBXmeFs/4fqpNU5YhMtofzvLlPzptKXKAM57VEM0uhO1lpbqScytuLviJ3/Qa+5FNaK
         OrVgEu33673VUaZQFQy/8uFy5nNryHe3/qGw8GrsRYdYme5rqaHUA4PPz8/IY3nmDp2H
         aoXkZc8GyDjoygSIQCKkFbZFtG1hBLjjlbEkAOwS4awo/Ieba6n7JW5+UGksq8lPG2NQ
         FDMtFOAC9NiIMfEhLIlbycHCiaPeq05IpFRYrlDSg46JV3LTfY1Fjo8SMp1xdQYyWki1
         YOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        fh=O0WzkgjDcVRLWWYI4TIglrGjpiVZ2jAcl1zRndsjH1g=;
        b=paIo8vaq8m5F4R4iNuakx+O44pOegSY/lJfXjIGhgzNt2ODwgk2pYcmdcH/hZ8AqCI
         z47fM2aguD8zu3yY65t3pmsuSI7TZIECJy2q6q3WzlRbPytbncbExU+ZymI6mZ9UDisD
         AoQPPGbWSj2J2hBEdT8vZaHE6sUAbi7awLPCfhkkY3l+prK6IezKvmRs+lqBk7oDCbjp
         PYwsfg1NbITKxNh617ik9z396YPykdYT7g6Y8mfuugTRwGP89WzvxID8QhRXIB3Uxjp1
         CK/kuAbn37Xv2EvQNDql8b74TLzpSedKZrndUjOmyRqSUOhAdYIT1kfZmBjTNZqFYElA
         XAjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784202930; x=1784807730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=RYfDUPas7UKfaqmw9BD9msspk3+8AXF04+yX+Qx7wvYvkIY5zIDaICZHnvr0uvtbZ2
         uH7XeuVZba10mY/49ZZKm676H3203Amiz5YN1Nn7Z8A2a4YSduOUHWq+4nN8y0M55dEO
         CEG+RtQbOwb4S7y3NUE8WPvFKF61Hx/kGa+Gy+8Ez3VjkXmYBnamz0TMH4OdI5pAFlqt
         ENluPwCBuvbLrr5tDNA7aEaZBVjbzNLniiWZ+QVbsk5YLfX8stN7pAf/ttmUlVZlarhh
         qnItn6oS80LLRgvjlaTPhStjaRo1yZ8SgT6csZE2kvAEWsopLsDujyUi7Ou6g9d/0g9j
         XKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784202930; x=1784807730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=Xl+3K1/JDZ+uXIFZJQ+GWxVLplwE9K06JbjOBUGccVulfKrgJ5F2LLbFFMW6eDWQ5N
         H380ncljZDTxfRHYO6QgRInEWzXP61SavILywBkdjcboYiHVY/gWrPcHvpyXXJcx269Q
         DMza8pOLLaX/kQgCN6hKQIVOV2+Dx0FDW58k9IpdOD0PuK53R/YMwedXgO7qWbtS54ro
         oc0E++Zb0uS6bzQlC+sg/dO6sbOKKCH5GZf6fIWr6Qgp45A+G2O4TiUtDmVzvCB0biC/
         5JAtzawkA7WHmypuoS9fi1os0uKAZTIi9aVK2vKfW7+XSbvFKKxc3j5NWZ/g2WbiWfx3
         nqCg==
X-Forwarded-Encrypted: i=1; AHgh+RpsOodvsZWjn9HP8B3LvYEAe7FYljrwF2xGnFluEgJSGpful754OTM6kKr7LogE1xkTi2eaIZMOA/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YypCFms8nbjysxe0BKSlXQVWu1SV4C6UqM8ZsIPUn04oaY+Qgm3
	d0nIUcdk2zfsujNrzF2YOJyHJfcpAw314ucJBgZ9zq0G4XWrkGlwp/FMUDUky7zzUPglYyDeEoS
	S6Arv7KtQ16H8eI+Ip6+9SGJrZbqCaOqukwGLi6NbCeSWeTOJQYdTOTAXI4hT7pPp4J/i8or4Yk
	EJbBZJteCLmsJc1p6bNZevD/oxikjeaP6+ivIfHg==
X-Gm-Gg: AfdE7cmPjkVaL/0Q7etLhpAMs4bgbdOwsUfK+ZgGpT3OAAbbobiXAYGDxb4zXCIV7ED
	pK65MUcBTMRC6DYr+71OdkFDXw8Af9LLvI0KVIyFusLv4pbCuNLsX99/PQP4l2S+Kbm33vGfaDN
	ww+O6wdWXiT+zwD6o0kw9cTqaSClnAD3hCieXH5vDuXh533WdNUPwY4rff3Q==
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-51e4ecca047mr71644391cf.0.1784202930456;
        Thu, 16 Jul 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id
 d75a77b69052e-51e4ecca047mr71644011cf.0.1784202929904; Thu, 16 Jul 2026
 04:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com> <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:55:18 +0200
X-Gm-Features: AUfX_mwNMY8bmSOOoE3tn-LA0Fojd6Jz_KE9ZsYKsw02nHYdKrjLLMH4z5Iwnas
Message-ID: <CAPx+jO9aajD9eFTEUdAFOO-wC5NduaYhbDmYw5DHeFj92Fmd9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX37Igg2LmExhV
 QSbh13rCLQBcOTkcOOsAUT+rJ+OG+b24QramtX1jHYPWZrAFT2IsONMKqESxirKKWIjfU56owRM
 dZGSbVxK33i3UDJMMcd6Fh88sFMEfs/8o6LN41QQ+YBIcrrzbT6QRK0Gl39ZyBMeBN8AkqvRRMT
 49hfZK69xd9ZuVosqkn8n5ael/CK/TGf4zKbbQC+DOUvno3Zy8NabuWakh1eufZ8yK6+V1zpQdt
 rSvI75EOeEXbVg1hRdPC881Rhe1z7eCGJn5HdNn/G8W8PFe8J+Wl3wMeKXbVQlANj/y8P24zX0m
 rMiV9DeHl/m52VrysKNKBgir6ljQAtpCagBMjZhET4AOnjaUe2OMhJy/vRXtzYfDu8FVfkzBl8Q
 xcSUtzyyVVNXurutO0976nSVjTyaGIqWceSnHOG62I3hUatz60D8VN19WyCt03WdfL7IkI31fQF
 DUUFU+GMofzSZlqlk1g==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58c6b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8
 a=AEl4uQJCqG-skdcfchQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-GUID: jOfM7HA9rXLdQWLBjieSOJRhcxVphRqX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX4umdfhmussXu
 cdq0dUM6z40+UTW6gkJpW3WUt+m+OsEZKIwzxBAg+85l2S4mLlNfszgc68DywiJVrmygIcWclmv
 UYftdbahJs9p2nnEK8hRHN4gbziNXWs=
X-Proofpoint-ORIG-GUID: jOfM7HA9rXLdQWLBjieSOJRhcxVphRqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160123

On Wed, Jul 15, 2026 at 11:11=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 14 Jul 2026 at 14:04, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > >
> > > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) S=
oC.
> > > For now this just supports the always-on power domains, and dummy clo=
cks
> > > and resets for the serial console (which is enabled by the boot loade=
r).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- /dev/null
> > > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> > > +static struct generic_pm_domain *r8a78000_genpd_xlate(
> > > +                       const struct of_phandle_args *spec, void *dat=
a)
> > > +{
> > > +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> > > +                                       struct r8a78000_mdlc_priv, ge=
npd_data);
> > > +       struct device *dev =3D priv->dev;
> > > +       u32 id;
> > > +
> > > +       if (spec->args_count !=3D 2)
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       id =3D spec->args[0];
> > > +
> > > +       if (id >=3D R8A78000_MDLC_PD_AON) {
> > > +               dev_dbg(dev,
> > > +                       "Mapping HW power domain 0x%x to always-on do=
main\n",
> > > +                       id);
> > > +               return r8a78000_genpd_always_on;
> >
> > This looks odd, but perhaps it's just a temporary mapping that you
> > intend to change later, no?
>
> The hardware has multiple always-on domains, but on the software side,
> using only one is sufficient.  When needed, it can be changed later.
> Other domains will be added later, in the else branch.

I see, perhaps add a comment about this in the code, to make this more clea=
r?

>
> > > +       }
> > > +
> > > +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> > > +       return ERR_PTR(-ENOENT);
> > > +}
>
> > > +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> > > +{
> > > +       struct generic_pm_domain *genpd;
> > > +       int ret;
> > > +
> > > +       guard(mutex)(&r8a78000_mdlc_lock);
> > > +
> > > +       if (r8a78000_genpd_always_on)
> > > +               return 0;
> > > +
> >
> > I guess the mutex is used to protect the global
> > r8a78000_genpd_always_on, but it looks like that isn't really needed
> > based upon how things are being called during the probe.
>
> Why would it not be needed? There are multiple instances of the MDLC
> device, but only one instance of the always-on domain.

Aha, I see. Thanks for clarifying!

>
> > > +       genpd =3D kzalloc_obj(*genpd);
> > > +       if (!genpd)
> > > +               return -ENOMEM;
> > > +
> > > +       genpd->name =3D "always-on";
> > > +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> > > +
> > > +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false)=
;
> > > +       if (ret) {
> > > +               kfree(genpd);
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to create always-on doma=
in\n");
> > > +       }
> > > +
> > > +       r8a78000_genpd_always_on =3D genpd;
> > > +       return 0;
> > > +}
> > > +
> > > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct device_node *np =3D dev->of_node;
> > > +       struct r8a78000_mdlc_priv *priv;
> > > +       const struct mdlc_info *info;
> > > +       struct resource *res;
> > > +       int ret;
> > > +
> > > +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       info =3D of_device_get_match_data(dev);
> > > +       if (!info)
> > > +               return -ENODEV;
> > > +
> > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       priv->dev =3D dev;
> > > +       priv->np =3D np;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!res)
> > > +               return -ENODEV;
> > > +
> > > +       for (; info->base; info++) {
> > > +               if (info->base =3D=3D res->start)
> > > +                       break;
> > > +       }
> > > +
> > > +       if (!info->base) {
> > > +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &re=
s->start);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       priv->mod_map =3D info->mod_map;
> > > +
> > > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > > +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> > > +       }
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, p=
riv);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "failed to add action\=
n");
> > > +
> > > +       /* Note that no actual domains are registered, just need tran=
slation */
> > > +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> > > +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register genpd provid=
er\n");
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_prov=
ider, np);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "failed to add unregister action=
\n");
> > > +
> > > +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> > > +       priv->rcdev.of_node =3D np;
> > > +       priv->rcdev.of_reset_n_cells =3D 1;
> > > +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> > > +
> > > +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register reset contro=
ller\n");
> > > +
> >
> > In some of the error paths above it looks like we end up leaking the
> > data allocated for r8a78000_genpd_always_on. Perhaps clean up that
> > somewhere here.
>
> That is intentional: the always-on domain is shared by all MDLC
> instances.  If one MDLC fails to probe, the MDLC instances that did
> succeed still need the always-on domain.

Okay, so perhaps we should add a reference counting of it, to make
sure we don't leak the data?

>
> >
> > > +       return 0;
> > > +}
> >
> > [...]
> >
> > In regards to the merge strategy, I intend to pick patch 2 (shared via
> > the immutable dt branch) and $subject patch. Please let me know if
> > there are any issues with that.
>
> That is fine, thanks!

Great, thanks!

Kind regards
Uffe
