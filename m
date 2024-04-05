Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911C374EB
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302405; cv=none; b=b54M8aR98P++cnofoIPMmriKhFhNwwyQKph8hQBiOzKT2oIegVOEE6fLHySkjW2O2FtY43jZtbxoH245HyGJGLUVGrUFV8nyQrJcotCxLm7Twb51dE+1kjRTctVa7VHu1EOVq6f746hU4OC9EoDev6EI6NecOk2wlwJDiHc0aMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302405; c=relaxed/simple;
	bh=BUGMRCvz83jiXivIrS9EOBSbeWYOBA5HEJF91ADZrAA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GdbK669IlGpnMYvBq2bNOhVP2xsM/TX9zqUcGeieBcZkBbdp9oWRWe9qVjG4JRsl+amZlQrgn5e5Lc1eXQ0x1uGe4bR4FwezLcbx+GRtSpAM2ZLSAT4wMwBDQahG0z/zRvxcg+ofiyUkucIWeaZlhr/wc2BvQ85sQ/Ob7eCqxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZReNa9YX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZReNa9YX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4163181a7ceso866045e9.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Apr 2024 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712302402; x=1712907202; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B8/hEIuRB1LDRqXgcrFwyhIe4/Hv1tlerPiYLnPY8pA=;
        b=ZReNa9YXS8ZMfOWeqpFpP4tq58pukI0QowpdIpckGF2mcLvUzbzAzMBoCeyUTVB9BP
         oYGEJIddMB5GJTWPbYk9T4X5zKxaHwCRK0I7eI4zWUcSkxRFWqzZvraZ491yF6soDDUF
         9sxa2XlImdBFLL9Ni6ZSsBpyoi9EXFZkskDI08l5AnRGZONRqn1HgdtzNfp2dY6At/g6
         xTOG5PYbD0BMnEAM9EvmWMcpG0to9L/5Lp5zW02GOpRnS4IEqUYBCiJR9ahGujW8fnV4
         pznDLDytm8r/GicMTSTPRgjCO+f0kyWKeQK5LD9pa2EpK5AuM/jHVCf6sU6K2kh5sBif
         HzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302402; x=1712907202;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8/hEIuRB1LDRqXgcrFwyhIe4/Hv1tlerPiYLnPY8pA=;
        b=cHsutqxdLnFvb/HCYTNnizntyorhTt/HVhjmxZNnH1lduHUuPwS/RH2q68r79NNE8k
         IviwyvzVN5XZCPU/e1UuAm8TNr5LUnavVH3z3XJbjhCDr1+EHfJchJAhYpLOcXp587S8
         DdCj2bd01FjeCLsYfT8FKlFFOBOMw9Y4sIquecrFgGOcoI35MRRbz5ztmy4kDqfjtoNX
         CCgp1D5R9zqKAK+5SP9o225G1oxElFcN6rjldMfNpEzOpqivYkoFwbxwMeugEliEzduB
         Mf4qE9C7579eEoe9JPaC1e44uFPjsOZkw5bciocO2l2XgZ66qwWXnhMD2lu3+b5gYN4Q
         owdA==
X-Forwarded-Encrypted: i=1; AJvYcCVwwPqBhRERzSuFDi+nzPaxy1uImBBkG/IS/nvSi2ii9jFjFl3PohSOVVjWAvR0YoYyqDaJUZKB84bbX1n+90xGIMG1RMPhzxl8
X-Gm-Message-State: AOJu0YzAyp84qgbkI4cQYhZs61ADE2MDaJ13KkQZ0twOIJVp0LHDth1z
	XZ0BXMIVmLkOMvwjh3gfJBO/1qV6/eNS1Vi0gOSzbJoIFM8iuMGlK/TcGXJDNos=
X-Google-Smtp-Source: AGHT+IFauYr0ttYbvunq4xdpMe1oQLsmvrROpymwVJP8xmztwIB4iqaH0gjqAwcT0IX2HxafV4aRTQ==
X-Received: by 2002:a05:600c:1d25:b0:414:7e73:1f5b with SMTP id l37-20020a05600c1d2500b004147e731f5bmr543430wms.4.1712302402435;
        Fri, 05 Apr 2024 00:33:22 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c471300b004157ff88ad7sm1903275wmo.7.2024.04.05.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:33:22 -0700 (PDT)
Message-ID: <560e9a5b236728f62be4bfd8df187071c4bffb23.camel@linaro.org>
Subject: Re: [PATCH 06/17] arm64: dts: exynos: gs101: Add the hsi2 sysreg
 node
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:33:20 +0100
In-Reply-To: <20240404122559.898930-7-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> This has some configuration bits such as sharability that
> are required by UFS.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 38ac4fb1397e..608369cec47b 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1265,6 +1265,12 @@ cmu_hsi2: clock-controller@14400000 {
> =C2=A0			clock-names =3D "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
> =C2=A0		};
> =C2=A0
> +		sysreg_hsi2: syscon@14420000 {
> +			compatible =3D "google,gs101-hsi2-sysreg", "syscon";
> +			reg =3D <0x14420000 0x1000>;

Should the length not be 0x10000?

Cheers,
Andre'

