Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7221639733E
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883833; cv=pass; b=a4exWGqhGu87fsVb32g4kSdnSZCHAIRJmcTzWihMCrm4r5YRNlTxtu2GuWtgBrJkhN/K715Q/fp6FpOU6qvyKTIufByyB93d00+OxqlMcaEPa7/HIBKTZiIa7CPgw4psvJD6DXvB3/mOjeH2qo2LWnPaqBjcWxRjemEfsamACNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883833; c=relaxed/simple;
	bh=ELUY6L+uHkCA5qf6j1HjWKoHdtzv2rKWvRfbldOukDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fw4Xtii64eDFUIjLukl+DK9yH4ogkmZnDKfCqrXAXF4VqLKCOSEJP1AloS+BEY22MU4a1n5IPTmr1zjd7W046w9u6AmXw4p7chAFs0h/BFdH2xFqf6BqYEb0gOLC4fc7P/O2UROOPVjoIqwagwr/jhWKZzMKae08C5RqozA8SuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKZUnAuw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2joKZyK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKZUnAuw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2joKZyK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fe2vn2738897
	for <linux-clk@vger.kernel.org>; Tue, 8 Sep 2026 16:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=; b=aKZUnAuwuOC2Mm6N
	dnQmHwM/RpKfmdDSX2+/4jASJo3vSdpnXrxREnPkUcqp2Bai9fmtJ5QWJmxbpT/m
	wgrSAgHAITZ/JdZx8jGT2Mz4RRt0yMoyifzyoeAfz/BUNL6tgruWcrZnc2mg8HXV
	/U1RpNx+N4ys4fKzP1hSbIkJxFkWqPQsi5/YMFnaNE1oVQ40463t07K/NmnYgZOf
	iS7zUFB4d70yG5ixvflOqQSRpU4DcxKpcl0MDLIILYOJcSdLy3Aw4uxvFd6MhR9a
	QxfCdi3dzrNHLVzZUe31/YIOZqNCn+AUVV59ucc5nIVBUmf/7SZTvKhgMqj2AzbL
	xA7B6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjk2br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 16:10:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f73d0f89so62523105ad.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 09:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883829; cv=none;
        d=google.com; s=arc-20260327;
        b=AJQmx8P6nwEfeMV6RZNf/cDFRw27oceI1U6mfCED2wicDeobOnIYW5me07gUM50Yz0
         6yNgMsEm2TjfQkZNpxv1Sc/8A4zq4EAfaPY/CJiR8gokDWw3aXhd/8d+YcT3exkR94yJ
         +82TjHXMsLcwdywst3k6ljF76B3m/ROvWN4DufsZ6BnBdv2yHTCbCpt43rhJdZUqIeZo
         lsm/WCBdujo+DhdzsxdR6beSV3YYJ/Xjl307terrJi2cf2OrJqb7zrkLtVh664S2Y9XT
         UpVNSBoIfZsGvmbO6MlLwb4y5p+eydyJmOzA/aAQfXdm6v7yOYodVRpIa5LrBLZhRZ9b
         D5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        fh=bZ6EP7AexVcMYQksMxn7KSYQkQ8BVO88UNDTbIv0vQE=;
        b=kAedc4GKK8pE0FVeu/YOspIxW5OqI6V9cM+xAlEcwsfrWBTbHzF98DSGgqhbyC1IoJ
         CFT0mWh0S8nOA7IJnbKIj+mSdoeAPufSbAN/UopF3E3SVKd9jJr1EDiWp53bDA/uBMCx
         isUuFNK+XJMREaVv2c62oBfaEVRa28kkNcHtG3U+W/mcTJ/H5jfEOAamJgklwREeHx8U
         p+/cwC5PpO9LcUeNIP4BrWgpN/YMZIUBC+D2hSU/2gPtPrdCCtWU12bOSr2jcCagt5gR
         5h9jGprZZhXbzIw9miw05z28WB2me9zQrHRpU/apmKxdPuqLb53qjSa9g30MnLeokdV0
         Y0XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883829; x=1789488629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        b=U2joKZyKjgZEggCgjyV3ZxTL8pLGkgxyYj+WTdsRhxu5IgH879EtsNMXCso3K4+Npf
         dFZhvdmz0a1djpB4fu3LMYZrt2Y0w+pksMjEN5YIr3qsUn4TW17mQVVyY5rxnm+Ten+2
         K2BlvsILu5RrD0p3CwFoWfou3WHFI45b1T25OvUo07GlzS2f8MtcC6Fp6YXbqZv3bymh
         /umxzxrQ0hn864YUDN2qNkh5rPSwfxG8QJUgYUB61zD+wF4hRxL9E+nD8GSKL4hdc/nj
         N+0XSlwLfDb5Eg6vnoAgdmh5Z2/wU9HudTxqWbZ+UzRdkigI2p1UlkGEul4ryVUvax+q
         pZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883829; x=1789488629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poYTtXrOshPnuod9r2bdqDYd8uCotQ96TbvuwA7Xqsw=;
        b=UMt1Gj5XXIvn+M6ftgmXVLNOyHBbWf0Zia0F/j/kfHid5Z+qt/PkA4OwNgVq2KaVTm
         Onw/T/HF3Li+O49cbkL1UrMrYLo1D2ijuAlhQ/Zf63VjlJ/ogOjK4SmAgd9l3+u+O78/
         fomc3kk9RLQl+Djrq0FIdT7M5i9F0i126XaCQ8uezz8JpSokHb/d714sSnPpvzgZ81WN
         VzuKjKdenrB8zNek1VADRQlHiyLJYcrR8Ris19l7Y2/pjDWrJdbGceZ6rCqCnSlk5ERz
         FS5Bv1/WwkDaE7xZWMZXO2wMbKJsk1iL/YkOeNL8ipwanRu2aiODQKh9cdvRmxB3Ph1P
         MCDA==
X-Forwarded-Encrypted: i=1; AKwUvBxf7SMbvG3lCK9TgBjvP9OWmJj6jDC3ZrooQBLfipVLBI47SQftUog2zxYAC5OM+KNvIJBRrKXx09Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l1Ny/tVvMDOXPDKJBN+sJ7oLj+i7+VOQjEu4KMmyXbZ7aQbbnf
	g2HjS227z2DoVrr6k/DKjZI7S+FMFA6zyPadvXjxv3ci0gagUNcD0E30QgF7bh8WnbuMWsfTll6
	yaqfcdWZS5RS/zyk9EM14R8zaXUqzeXWA1KbZTx8oVbmE+bosYh5S/GPBgZnBnnM/AizzVHVWv4
	4cn3Oo+rJJsMfPkvghhiWk2e2CFRZlH30q4thZYZqZTV1y0Q==
X-Gm-Gg: AYBFou1KAWTQbQfDTJbWEqHNQFDx4S8NYKO39yI8iYDY5hLszLH0cwXhSkSvmJWSrhe
	SSpKJ72UuXSBgyws1426BDPKWaPT/m/VFDvWLkPSt+ayxoJaekS0cV79n1sGsKNv/upLb4xDCdP
	0pGb1WaONYANGTUBCo/G8K3fRz1UlQm71As2IFpuUIL74ti0fTws603iWXpQ==
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id d9443c01a7336-2db1258c686mr415608035ad.8.1788883829151;
        Tue, 08 Sep 2026 09:10:29 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2da:effd:f904 with SMTP id
 d9443c01a7336-2db1258c686mr415606815ad.8.1788883828558; Tue, 08 Sep 2026
 09:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787240090.git.geert+renesas@glider.be>
In-Reply-To: <cover.1787240090.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:17 +0200
X-Gm-Features: AcwNN1VTV0JnOl-p62U3bYhCoItyrrp3uBkyaa2BVtYCssF8EZkcLiIZNULpQBs
Message-ID: <CAPx+jO_Q2A1LAM-1MTFwGpULkiyHzWRUE_tpWYWfO6JzFAcdxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@amd.com>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXz+owXFxJHtxH
 GQ016rajuDPXiYX2f0CtHDPyGdUjisDVbYqsAIlbH/AvZE5qZF5XH3zF7imF8X+OX5RaIprbPAQ
 gPzAFipsJqhxiROPPYgIvRMU57g0UTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXz3nkjiAMT/5y
 YKCGRjIATie3BH+DaFBvmbBE55fr2Di2rz4msA8rf9vILl7sy1/cYbcBsX4kwDivzToJsYj9TJk
 rZahNlolicpF3FkWt7fmE7orb2aSOwDm6ke3fkMyje9NlFJUu2ynCGwMIOs2Ral3E1iMleTnWHr
 N+rtO311ZXF7xn13yVh9ga16UzUYxhSWuy2awcEPz67WnSifmdao/pw5cCSo1G5RICA5lUvSGi+
 to6AF4FFIOgcH0Yqpq3GU0XiW9rkjtUh7+JkD1GTw5Hz07YY2DRNogTZfuRd+QC7LjcpuRz/kDM
 FWoub3BSpHrbP7u/eXy/+tqk7mBKr1vJa2TOxdHAvQ2AJvqkcNRM0FNC3X1PxYcn/3kfBbXlNCY
 CovX/dFdmdvUSylIjnzP9LHuyGRaKL38uRBpSRPOXGqRFqLFtxHa1QAR+aqFD2joiQ03ybCcB9e
 G13jYmD5PTdsT7ME5fg==
X-Proofpoint-ORIG-GUID: R5PKGaRcAhBDkEm4Kq9IDbU3AofHp4C9
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa03376 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=gdcvayKpbD3v4lRZIwgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: R5PKGaRcAhBDkEm4Kq9IDbU3AofHp4C9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174

On Fri, Aug 21, 2026 at 12:06=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
>
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
>
> This series is the MMC subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
>
> Thanks for your comments!
>
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (2):
>   mmc: meson-gx: FIXME: Make sure clk_init_data is fully initialized
>   mmc: sdhci-of-arasan: Make sure clk_init_data is fully initialized
>
>  drivers/mmc/host/meson-gx-mmc.c    | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --

The series applied for next, thanks!

Kind regards
Uffe
