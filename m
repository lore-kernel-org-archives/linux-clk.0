Received: from sonic308-9.consmr.mail.ne1.yahoo.com (sonic308-9.consmr.mail.ne1.yahoo.com [66.163.187.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86B135CB6D
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785707314; cv=none; b=pNyCbGOXNmjUtUe8TOSoPkpFKy/2HOafyCRz9OBSw2FMe70S5HgJ30j72I6NwP0pIJbhx0DFDeBCe/usOZUv0IzsiCwGHkx85NnlkH3CcEcvwxncX6IhnYbT6oFtO0z/FilKqkkOuKSCSVICJa4shAhEHAO3IYmLy3fAOM0UkSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785707314; c=relaxed/simple;
	bh=+1MY16bzPt4NbE9V8wWBlAuy6VoQh39Dz4XbvEKls5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEmgKJfMyfg28aqMohQ8iocJC3rx+2GQdq8J4kP300wxs1yvkdD5m15Mob6Y+sQQj9IOomXkcwvqkHmpU1ZP45QbRLmRDGUSwhrsgFlxyvzvzTlhjo7prus7R0ViO1LfhfxsbIXh8W1AqVBRXnJfb2BtBa/gLapJ3TeSxPSMs0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Xtyhmxfd; arc=none smtp.client-ip=66.163.187.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Xtyhmxfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785707311; bh=mEzogKwXFQyY4BX5HpkwhAYEsRSuIVZrjPgfR0QJz2c=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Xtyhmxfd4mIQUPLsiCKnCY/DwyAV6e2/nhr+iX8K3Q1UNd6lwKW/HSLvaYimy4/mHyJflnLSxqbf9/hFIdw+D2GOiiqibd3oGhAqbxnhrEbPyHe6gHWDkp9/5vTf2RavWbnkDMo0xwmWqBIPrsfRVYquAItLbxuye5Ge7HmFuL+KB6YA9ai1c+iiebli24Gg/n47Tww/Xq9W44V5yhYXI7ZfgFy1KnsaggFqvqfPL1HoXk8t7nh5ItK2f+8BmV9XRU9ON4BugQkU3z8M89gUYEFF9wVYVskfR/3efZZvwxqaLdIow4YUFNDxwLjDkegqjZ6NoV8/kqQQ0gWM7pKI4Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785707311; bh=vNSj6ZT7X1dBbxZItfLlu+wua3aKDb3I8TDN5Nyl8Dp=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=VDc6h92EBOFrGJN1oaSjaB4WJvO1k2hhXSzldUwcBgtKJYr2960eTwHznicVOy/gOn8c+ILmApYz7RII7c5lM3glXFB9Ej1fHQp6RWX9CTfNbvdj1x2ArukH0Z+JJLalAxpdilMdCJnjuX5kU/wabjaJ+YMdohZOsUBW8qc3wKlWF9tSQdsYEOG4/eyau/OMgcMLMPDnp0Ib6IhxZOK9gORc/uJBrqtpXaQAAkeS9KwMyox3IlKRXAn21XoNJ22sdQLh6Nu21A5THR6OdBYM9w5yVw+t3t6ysyCbDNeo0ToF/B9zedaL8riahe9DjkxvDdp4ueS0cizwae1/x3s99w==
X-YMail-OSG: CwBv9F0VM1mrQd7HrVIbI6wM1dl2kNiL3SUTDrOVHswp40CmDWgUte5NsMQFP2F
 h715xuz.ZKh9QVkdNwTuj_lqW_i.GxWWum.Li2JOCESaY5VSw5YWoU9kgUR19WNTjaaKSXEoxJuB
 nOE0APysgG__D.kS6D2CO19W6VHDBcjWI82FfSNpI6t34GhUsK3oNgTuok_ZDGt8iboRqEhpfuXx
 jzIcVVU9TUl8hGuZTrBp.F7EC0WBbyxvRQH_54MN7uf7rE.WselQ1yshq7Ch6HSui4ZaX8q5ofUI
 uBjPkeDNamZARj4ACIlM5Nyf8EIf9G4ltSBY5UZ9yZ2HEvDhwGuhGLY2UUJgSs23p.TCoh7HtNwm
 FplWXQIxGBdYxadB8GcgBif6mbnyIb1mVfnPdgsnXKdLE57vguk3O_9ssMtcB_20WQwMNk49Qnfq
 N5ZWzCc7FMiPla6RT.HtvBEpVXx5RApiVHDdjCsJ4diRPV3aqzuwDdUbvCzEKl.uE3kzlUcIuUiE
 S6MmJsdpS48ZqnICRdPGQ7aWFi9POGEXvFgK1l_af3J2OEewwfdADeGdiPmqZQWywbtR4y3Bg.YV
 4p0hbGpltY3YQSnzjDPRlrqTiPJFjkfmX9oHtlDmO9LC_Oqn4DE6f1nX9vxHBFdf6rUjovCE_YGJ
 py8Sib7dTT4yn5izS5TTBaN7BKNJf0O3H3FANbfkT.WuQIZPSNjIYr_z2x1pqLe7XJKOK1cNyFuL
 RF8TPuIcS4KRacbLtEeDDofzP12CcocoCfL3NgWhGxnulKUofiP.k9PANpLy1kD.oegWLNItj8Du
 RY_2k5acgFCCI4uSCGJMmoBLRPEzXZ9wAElE6CIY6C08_cgacdD6FshSaBkcOl4dPl3vX4.b.0Xe
 ILDnSjiJLPgLhNSQitNETKvBblpUwjAlTi2v62dpqCggqM0hZq8TjDNGdObMvKqIBmpqapP4oTZi
 cvfRVdF8PTR.KGfH6HgHI0XiqqiNNC8aGcZF0.CLKa5jIxtzMBipZnGCSCEMpp0bYhnGlsRsHSe7
 Cpwn71niwMnJTt05n5HFEhejfMXKwdEFvvmKLCv6fuxezY1bSBdjwWZSXml0itVZu4LWQnBNVNvi
 zkkErnsegavUw2qvUN0.owrQcpblhoJwUWPSd1sz7TswXjtP8GO3ZWzRJRZhHdCtbfoICKASWQ9S
 DhPrzTmwv4falWAHAVc7KAFddNqjcUsUMiyIpr_BwXaCqsi9CbLX0G9oSp6VqzcFicRu2qBfGgm1
 brtD3_qj_78x8yaC5TSMIiLEZgimiPZ.tPqW_9ZGFwhGcpuPeclJ0OgVY9xV_C29MACisn8LzxNC
 0MZhUQ8enJ77BgMM88aPHwqLs04WiMPocOVK4SNbP0J4wuriJNOv1yyGbR04fbU72jmsABtruthA
 3uaqj17tidV3R.c5j91aJOFuOpr8NGtPHe.HzxUCvEA067J5ikN_MFOIGLjb6QeWngcudtRmkGhG
 _oAVn36geCSxmdJ.30OxuNgJUo.54qxDngIOm_AVLl6zKr5AbX9W_ZRWUkI_87GC1RrfnxGJMnn1
 H9SNgmpylVnA3wCfZif.z1jdMilc4E6UqVsZoKY0Bq90CWKGrX14jTaW.rgz5.sk7CTvHhQjzlKP
 4j2nhXEwGA.Goy.M0yMcnMiVqaEajlkPcdzuMKYNi5cyW5oc9M7cTrzL5qVCPaiMqaEaQNWOXqnN
 JjkD64D5jGyu12.rtdepIjPhQGmUZsZcoBlVO5Sh1hT.OI9DrYJDB1cCR9RN12kaRl9a.x.ae_rz
 Cc8SOd7f5BSvRu78f3j5TX9Ul9MydVjOjRzpPhebyz869RSLODXMPZojPL6e6CtbctkgzCmnx_6B
 EGI.TDR47FmjQOyGqTCzFQHVfGA9DwbxXEG.FifP_T2xmOUbUmzBCTWy0.uzySTw33lPiOfSAWdd
 k0BczAQ.uif4yunm_ow2Mc4Pvp1Cta37TXPW.ESLRjSiKgkeq2dyE2plEpaolq5EK5_L2kseH7HH
 u0MymQsfjf6ItGqjmgOqlUj3ssJEiCyCeD.2SuvVs4u8UEgYYID6xeDLThWrqoMFsiM45jU8rYav
 nKaNmEhHkGoa2uuTtv9LffX.AE.z98H2WjvlvXIvmITPvuzkx.Zgb6TRjLr8YCdBfNyNH0TPvzRD
 y6oP.ury8Nn4hm9M8ifMIBefWzrNELZtGJL4UePLjwDWq7lqgbaRKNsAavYbcmzqcJ0Rm3cXrVl8
 qkUB4YYFCV49j9lnm.9jkvuHHR1SSnnHR8T9BCBlaE1xw85xztnv0UldsLmJ0yxMuF9r7Y9rY6ns
 sgozWz4P4mBAkA_jliTsV9UeIgOC4CoEPXgpL1w--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: ae814843-2d79-4005-91f5-1c49b9393985
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sun, 2 Aug 2026 21:48:31 +0000
Received: by hermes--production-ir2-676cb4d88b-zqvpl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0d00dc9ab74d64b5db223939a75cca93;
          Sun, 02 Aug 2026 20:53:48 +0000 (UTC)
Message-ID: <21ce0556-e32b-4335-bfcb-510cc6064272@yahoo.com>
Date: Sun, 2 Aug 2026 22:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Luo Jie <jie.luo@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <20260730191353.557494-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26180 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo


On 7/30/2026 9:13 PM, Stanislaw Pal wrote:
> The probe function takes a runtime PM reference to enable the GCC AHB &
> SYS clocks of the CMN PLL block, registers the clocks, and then drops
> the reference. Once the autosuspend kicks in, pm_clk gates both clocks
> a few milliseconds after probe has returned.
> 
> That is wrong on two counts:
> 
>   - The clock ops access the CMN PLL registers without taking a runtime
>     PM reference of their own, so any later clk_set_rate() or rate
>     recalculation touches the register file with its bus clock gated.
> 
>   - On IPQ5018 the consequences are not contained to this device:
>     gating the CMN block bus clocks makes the SoC hang on a subsequent
>     bus access. Measured on a TP-Link Archer AX55 v1 (IPQ5018), the
>     machine dies silently within a few milliseconds of the CMN PLL
>     probe returning - mid-character on the UART - and the victim is
>     whichever device happens to probe next. Whether a given boot
>     survives the window is a micro-timing lottery: different binary
>     layouts of the same kernel ranged from occasional failures to a
>     100% reproducible boot loop.
> 
> Keep the runtime PM usage count elevated on the probe success path, so
> the bus clocks stay enabled. With this one change the same board went
> from boot-looping to surviving every boot attempt (verified across
> three previously-failing kernel binaries, plus repeated soft and hard
> resets on the final one).
> 
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
> ---
Reviewed-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
