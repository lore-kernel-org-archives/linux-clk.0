Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F87407562
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083452; cv=pass; b=gCs4axmP/FHSqD0ZTz1P7RB6GsZXJbq6TCE5bndwhgjssHRKTWWMSWBaLE1We7AOh09fyRo9rt/qSdyyziCRNtivv1mjL/svKM4HFORvmoLHMD2jg8fKGm37ThmFCU4yfllax9C02TCiKrmSY2Jz/1kQ0WBKx2pAH/fdcbJIXzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083452; c=relaxed/simple;
	bh=X3hWCPtAHf66rCoHEjgzZZXz3d7jr9a0ZdE4RDvb9rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GslQBGaN+QiYILe1mEs17EjYcj5aiP03iz0PT20cN6bHzmobKqjgtFVkL5cHHp55OF7s0fIyqEVlQJSck/r4JFaiuyRan4SvQWuS5yzI1rzEsbeAlWwwvlg1C5xJVgPCPcqIAv8BmoLw5i63eglNx9yJQarUkM5uWjHOYouE/ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkUmpRiO; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkUmpRiO"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233b172f02so1365191c88.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 04:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769083449; cv=none;
        d=google.com; s=arc-20240605;
        b=dKlC/Iyy241bxIjVJX2OlwcAmr+grDh4t5RCYeWmBVGQSHUHcm/vpuQNaETMGpjBud
         7SsWpvcLsoFBbJTzsOEzYupGRVPfZCm+oCEgOCu6q5A7w51DD6kjLEyDFm0lVzPRpfJj
         XccZlxXElCICKETlu1yEFWfzYlUHSrwe7aaEvcfOLEtrgSRd+JuFvp+xIl2wtu7hOsAQ
         8/7zH1/+9TJdNAk6xb8VuFWJWomqb9mxKpWvvnDeL/wOoaQie6JuRsIXeZGyO0daMW9Q
         zUwRJPQ7Ir0TLhh+7QK9pOyR3/midS2z0wZ5yk11QjiFBIQfEub9ithJyUgkCyIlUTR8
         17pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        fh=kHZz/MpCm6w1ZiD+TxmpCXSB9yYDft2gMe+sSfHNPX4=;
        b=c2VhQQ6gsmk0CBMXYILUCR853gKRn+JRPZ7887a8kQGdlTZPMyX/Txn9i65MkrV8vx
         aVa9Cp4/OhxNwKRR3aIzpeDrLQAyBZBtmMC7EM7ST0epLR4Eaa9QkDKlUJCCGSs0nz2b
         loG5GU87wjh08+F46+BIcOmWYaYtMxXUjbIV8SamUlsQT5bXEiA2Lb2yew4F3L8gOkQk
         a8hNQcfH2SSH6bx7I/pifN5MGQd04oJGxdAC92U8WFHaktuWEFeaviZZOIm797ONkXNX
         yzNeq5kvEa0qNmtXUHUneZgyRsy+T02Di9tbN949UqS38KZ914BhPDnUfR1pNzplDn0Q
         SxJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083449; x=1769688249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        b=mkUmpRiOhzVtLjZfgMO8+PTA51efjBa6+3mw3wVEd37Pt65d4OCJA0+IwYLz8+1BZ0
         Na8fVkS3j5qKc8+OqZvuRW95g0g3i/Kf3gLCdCLJcPTSXd2ya3PwGt14oOb33KjPHS8/
         5bhAPT0AOGLjTPPuOXA+6a+cBop6YTgwp++bD8MRuoIE2Ip0YYgK1hMYmT9sJ0l7xF0G
         AdeYekAcRqAaIJbxP3R1tQnK/BC/rKlH19jjA37Xb9skdoxn/jm4JmTHfx77rnkZoI2S
         oH2ufEUaO29AyREv/iQeX5Qebic8UMjXV0mPbjo+zO/881L8oNEyEl+VV4irRT2XIMUy
         ksWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083449; x=1769688249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        b=ukRSxKuPwW4RH0uTyTUkU/ie23ijPNci2FDqBffdjKCrXQvjNRWaSEgPUF5Loa/FdI
         uP/riKI/XUvWSEBIS7xTS73/FynzpImI1NpMJgAzrQkNhH5A6kcgCP+IdrXtzXXc9vlj
         yR03gey3YY+7iXaGtj8hObiYz9waYPGG5J+iPbpuDRdS8NRzJJZZY/YUxGrkOnLSecIX
         Nan5aYbekXGs61n2mJFE9bJCye7PvF1okMnRHNpu/3wwDDQBzt9eliatByHrhDKfxO+A
         JwswjClI9L6llbpjQZWKvxTdeUBvFXN22udaZ4ErksS6Civg1pSOCUXDNQkoaun5lp4Z
         t8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHtP4uosTcpRfTtJWqnooiTCeTlYK69p8bJOYr0au/nRWmO78TweofHr9djMe7JieznrxddDN208Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfksLfvObVheBjnCD/Td/djj8Fm4MzyVueAXP+2bG/+4tlBCO
	5U/RxoeA7wnMkw1P26ZsxDkhrkdN2YQpE6p4rEBm+CCDREqZD+55fYKW5ewWNBMuUQe7y3RpAfv
	AT1MwOl5IwLZECs/5GDtgQnYWfjPCN1c=
X-Gm-Gg: AZuq6aKYUXJlXYyLZDHdgO/tSZZczsmJkI8JMEfjkVkNIvnxIi3xBbtgeXvDMBx0rhF
	RZ3S9oUEtq7ldBObHlawU52DV6p4BDQfXFMDI98AiaPJTpi31jUgQ4TNilXpp6I0XSn89OpnGTm
	vz7gG0QeVetSzhX95gHyjvpZq8lvRSEBuP2mXc1UEi0zm9rkVTG9EM/W3RnL0WaO+lP9RuXXQTE
	EruS3tAFP8dBLKiwa+rHLHGYFM7wyAEL5UcZS6nDru+NjvmCsuzQPvmNndYmwi7JTecRv1AS1u8
	6B20q6yfjvnAO+2S62vM72xUhFJ5TZvYYoRafwMjpqyiSpB/2om63vFXg1znmwTV/qAg4LcpfuO
	7+2az6JtImjXLDA==
X-Received: by 2002:a05:7022:6986:b0:11b:b3a1:713c with SMTP id
 a92af1059eb24-1246a958283mr5461620c88.9.1769083448808; Thu, 22 Jan 2026
 04:04:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com> <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 14:06:47 +0200
X-Gm-Features: AZwV_QjimaKd_p8jdtYQifLmLFybP2fWAwRE2czS_YKMQ7pErfdW-RzqTfHjkKk
Message-ID: <CAEnQRZCR3oNgfuknUnm88P2Cc4=CYc+MEd-hPtdceRhGhNR-ag@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: imx: add required clocks and clock-names
 for ccm
To: Frank Li <Frank.Li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 8:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add required clocks and clock-names for ccm to fix below CHECK_DTBS
> warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dtb: clock-controller@20c4000 (=
fsl,imx6q-ccm): clock-names:0: 'osc' was expected
>         from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.=
yaml#
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
