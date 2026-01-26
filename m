Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910822A4E1
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456881; cv=pass; b=VrsoY8voJCbW6eO6rqsbROje+BNOtVbI7v1P2RCc/K6kprrc1PPtXfUkO4NedH0xXdmnHIOTy5cNlGoj/DUtfbNHPCRbxUJuaaYR7iKpWB8J0ErTfSbTZ0Afu/OVY7IqOpkMi40QIaiTmgFovXPq1rIfShCw8fkC+D1mAGPBfRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456881; c=relaxed/simple;
	bh=E86U2Pp1+kEMZ5xTDOjPoM6DE7sOtiZh75Z6gIblXu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gasf5q6/aYYioaCvE0oi1RaslQkYYI4W1hDx4RgycXxQdqJXV4ChxEwC4D6X3x7Aon03IJ6Of7DKG39qXmrhdKFbGDzanuSvyJi4D7rwM8yLMlrmZQlwMeQT1PgJLw8GkAzzJ1PWukKYb7z3HK9tafAmXeUo+PfodgcfK5gh6YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkKUh7MJ; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkKUh7MJ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59ddf02b00aso5317147e87.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 11:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769456877; cv=none;
        d=google.com; s=arc-20240605;
        b=TZhqIDa807+nSNJMg0xe9Bhayot+PqaQc6Jmxb94jGC8QbmQyYV+WTkT58MQ3LsJ8I
         SdF+To62+6jQG8xaYBYczOiQygWLVeylgecwrvcczKi3AsisRjSNjdaJMArGeW1HOaZZ
         NJQ75URYOSBr+yfVPo56wzbhZuyN367G6krcbeNeHGov/N59rAJZiq0oFxQywwAlzZ41
         Zz6KHYV+Fd7Iz4XpRO2aCCnXSWaGii2XSIRrKIHDCLBY3+Wu+sFs1IMHJx0MmBgks15k
         8MTwfbgYTXBhflAvsRwWPiE2PB9c5goawL+idaqc2rmS1ZU1j/ovP0iTkKObv+5giLDF
         33IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        fh=/oD0Qz64OXjrZOS66XG/GuhS42tJoHtt+YqfYvDnscc=;
        b=Ko6sBnuHKirQgwowgEnrBiQrMUsHO4pG0V7mju/kc7qwJp0fJLh/MBl0budywcBW+U
         NcSH4mOklr3RI0m4RgZ5OJxVJNns8m3vgKEqNR7MlfU2QZmdggpQOHSsgYZC8e3XiVn8
         s3pAQHNFX4lTilyPQpaEeX1VnfS43Yz5SrT5kLD8LNYNTx75r3DZmOHzPnH23ntPUzfg
         um8/wASWUSRa/V73qTrKtHrifcpALs7VBG6ZB9gNj+Wd1DkCYknYVM/4udAkDNSKO9+z
         ycpEryU6j6fk2RPzbyJI8VQ4c+AymHqBeT0D+937QpGkm5wBx0A8NztxGJgy3+qxECvT
         XWWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769456877; x=1770061677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        b=XkKUh7MJ/zGes0PcTeUsbvgslelXmKBmQI4dXrHzTH8/SydUKBsHUHd+dSj6ja7f2U
         2xuzpUA5KrwEZynOIObv6Fdl23tqhsm2ZDoTBHDzQs4LTNHBfTIISmkNYXtmtDHhOZY5
         EGQDq8euupglnN6bqxLPsdYw3yM3vjDzovy3NThI5iZWQuMzmd/32KMPPSXHwZg5udDU
         aRu3qVFwtS6KjB/662HWKZpXh22h2U5MYWYbu2Fp4ww5fI3TxUpWHrLgFBtMVQ907PKT
         3irV2aUDzAsjvSM1jXGXc1Nb24OJzx17bs0yh9Cg5ZmaWG06ZJw+v2r+SR3ZvoSmBqgS
         D5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769456877; x=1770061677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        b=SOroiDqZGnueQQKujfzOPa5Mr1VPTwEf5mMp+S/PBn2pPKrBHs+0tieCcyV05yIzBI
         YJBXom6Ewg7nPMrMDXRf1fNss1ZzBZh0Necpusipen8RIuX/s9Q2jMMw08o2rleJs86i
         XbHY79ggtSgunwWy4isv78bcPkMRCJjsyTaEMs+Iia4mU2vo9yOa1lKwf/44HDYuBzBm
         3uWByovGDyNxB6zHt6rPERWT0FlnRQDRLfdqe5TO88clofeF7RBY/9HFR1ZAfc6cVILz
         rHZp1y0WAfCA7J/cfKeXn3MtBB+oTpfkXtqquH/u4S4rWVy2ieia0HMp4/PGpNrynHhW
         K6nA==
X-Forwarded-Encrypted: i=1; AJvYcCWPudWLkEZW78zKpkE8oIVRtx3+qEAdaOiXBv89qRSKhLKgXvSTuhGObtPv60jqgBXLKoVJ+Ka0w6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFAAISOBLVajbTq5DIAKhxWdT1/4FELp+Atavjx2ABImBve1V
	o3XPTbU0vDHbbM42GFxm3IYE/xaaIqCfKC9mq2BA8ZTCShToxsYvJ17KOSUo0g+mkD9UMP2NsIO
	l3EI3vB5zlB7I7iA07kSmiqWlm2kAv+M=
X-Gm-Gg: AZuq6aJRwFKsOxrL1bJ9vRf9171aSC4nKX2gRt0kF/UFGhQB3ySrPpPDL2kG2YhbToY
	B8nQJZZFpXR9fCHLEb7EeNEc592x/FECdS1EqBrJ1kCQ+n1xLIDMNwpqQU8GwWsatKCUuRI2/S4
	8dXj5+c5zrENYxYQDwbQqfOTEdVvWesOirwG63ooNzNHKfkvo0ptPBb70xIkT4ja44L4LlIT11K
	4MjMi6tGzPsZDxJNHQ+bOzatrtzDIlg+sHnOEladAMGKmiuYyDPFV8VyRSD4eHHtH8WuAgWLXbv
	fFDs3EEkDedQ/QN08DsaKHKag3o=
X-Received: by 2002:a05:6512:1087:b0:59d:e9f6:1391 with SMTP id
 2adb3069b0e04-59df3a1408amr2177134e87.34.1769456877066; Mon, 26 Jan 2026
 11:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126115349.1750578-1-lukma@nabladev.com> <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
 <20260126203307.6076ba9c@wsk>
In-Reply-To: <20260126203307.6076ba9c@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 26 Jan 2026 16:47:45 -0300
X-Gm-Features: AZwV_QizXfEBcPuoLKyFUr1dg6OQ-LmaBQRERKbYiAht9E5yQHfaWrYosy_qY4E
Message-ID: <CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch clocks
To: =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =C5=81ukasz,

On Mon, Jan 26, 2026 at 4:33=E2=80=AFPM =C5=81ukasz Majewski <lukma@nablade=
v.com> wrote:

> Conor (on CC) explicitly asked to remove VF610_CLK_END:
> "[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch"
>
> ------>8------------
> > -#define VF610_CLK_END                        191
>
> If end is modifiable, it is removable. If you need the define for the
> driver, please move it there.
> ------8<------------
>
> I just follow what he asked.

You should still use VF610_CLK_END. Just define it inside the clk
driver instead of in the dt-bindings.

Please check these two i.MX93 patches that explain the rationale:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19-rc7&id=3Dc0813ce2e5b0d1174782aff30d366509377abc7b

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19-rc7&id=3D0af18ba60752e8a4ba34404c1d9a4a799da690f5
