Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D738B99D
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385326; cv=none; b=cB2cjktChVdYOFHXiQDzQk8+LmR5szdvTa0lfVYxYjhwjhmVBvH1tUeVMAWvtaMtMU0Mps4Z6d0gwrXrwskhMYEWUrP4KCYVnCWS01XRmj+PQS31T9hqFDqM4+lWd2FEyurxpSCKy1xCbv+pbWk6P2tXLahSaBdrOWX4/dGtnh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385326; c=relaxed/simple;
	bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RCnY5rNXRr6xkhdA6NQ3NdGCjTucTzGBLmi8WEOQy7W83mPp+d15tVrWbHn7srU3ZYtvbqk9u5ODJgNgEsE+9QQgwmPTrrZgzZRKDUPUqbRAA6Wx+q+687tTioIwTSWcapb+DTvsiBqeCsfjR4VuwFVTapoN6HWucQSaVRQupXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ghupxcdT; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghupxcdT"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b04a410f42so7623620eec.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 02:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768385324; x=1768990124; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
        b=ghupxcdT/aeHjf39mpyt5EcQaM6/SMavCFYJkPV3iqxOvscTht/DQNCF8XpBuKX0OL
         4dCm4+Xpc6pL0zNpm2sNbj0C9A7k4UyYH1TNm1FGRoo2cHlV01XOYAqYW6j1gTV6tgrq
         bYNXc82y4LdmyjeNxAYCmig+5ZUEeIuBe/pEswyWFcll+gqgg2Y2HzWId7D77SpA2Kle
         IBM1RUOF94aIlOWB+E+Z0MipQW1QchLHE1yoh23nMF0CukXbbEDEWXRxmCUcHLeAxHJL
         Gkw/eKwcsihF1W2axNw17An/0HOioTLhOD5nMXPkOvWTHY4DN7zjHQnHOeLoRzOXXdXK
         vK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385324; x=1768990124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VVV4Ijmp3Ls2wh1WtR/yQpGrW85l4Zba4/iPpipd0s=;
        b=gcecM72K4gzOdW46z4Dq90Msg48sFY+hN/iS54p919c/j731UMDFz96ukFovWY4tRm
         zGyY7Tj1HoonUROoow4V2DILS7ANTvy2y1SUTLfof3VRx6oYaHoImN0j3uDxU+8tr//R
         hfZyBi9yejW9LDrwOcw6oZ8mWH9dUFXVDsbcWyEVGe0btODol6sll6S7l7phgzrRdCk1
         zZ1zOKn/FjhPL2wOHATukdPiS9gS+TfHBoOBM8GYfGWP73KEGt4a+FbWjivankv9dLEJ
         kRqJ9ezTXNjac6uMhO/kyEjiGdefDSVZTOMuD02wilJs9g6DYN2QLyVAxsx23WImbhfU
         gGWw==
X-Forwarded-Encrypted: i=1; AJvYcCUYw6kHS3qOTBkPejmewlXkVQAeofnDjfS2e49ByMF6UuOSdTixpJP3Mr7n1xq//jsrG+WABz3IEL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxV0z/tRRvkKuwC2WLlmObJqKhGNJLj43YttofLrfD8Eo1mwp6
	JHgg3q3cKkHfmHIddT8xxGaDZjPa4K+xRXZYf+VebGferum3mNja7kpb5adE7MneZ/w=
X-Gm-Gg: AY/fxX5j5X4fDqNE2tI8LNvh6KUHrl4nAcZG9giGGwFz1O1YH7wTpEBtqlt/xoo4hlX
	3f7rafC31/XKxgjpxxFj+6C8pte3N/gLoegFSVnEVYgSpkZYkNg7P392MDTQTIsQULqLtMZ3L7D
	uqcBmGFobsF+rarm3jIMP/aU2fslDDgoJoVTPWRY5CHr/ZovaJHhc3gTIO8am1mAhlMBPPfiWDr
	h3g6DIXP2qHd/CXDMLm2iV6+fIrnFh/59HCy5pNupGCRNVNALs6KMrjVS4vpsfYCc/DrvhAhZkP
	HQP/v4MXux3Weo9KsJVvySRZwxAAn1YJUeyqMKfZeUMh9toXj9wwdv9QTIsc7Awx0yZvOnq/G3M
	JBTK6gC96Cj3qpCBgcddBQwsHfheU+BHE1qprXci150SlJpCqNjxFpF+AaxXrmfjUZRolHQ6rs7
	H1OsXQO1zEg2soqHmy
X-Received: by 2002:a05:7301:4e08:b0:2ac:1c5a:9950 with SMTP id 5a478bee46e88-2b4871eb693mr2526439eec.34.1768385323644;
        Wed, 14 Jan 2026 02:08:43 -0800 (PST)
Received: from draszik.lan ([212.129.75.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d60b1sm19790893eec.31.2026.01.14.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:08:43 -0800 (PST)
Message-ID: <c449218000258224fd9460e898b9705c1d0d415e.camel@linaro.org>
Subject: Re: [PATCH v3 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Wed, 14 Jan 2026 10:09:20 +0000
In-Reply-To: <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
	 <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-01-13 at 10:59 +0000, Peter Griffin wrote:
> cmu_dpu is the clock management unit used for the Display Process Unit
> block. It generates clocks for image scaler, compressor etc.
>=20
> Add support for the muxes, dividers and gates in cmu_dpu.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3
> =C2=A0- Alpabetic ordering for all cmu_top children (Andr=C3=A9)
>=20
> Changes in v2:
> =C2=A0- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> =C2=A0- Fix dout_dpu_busp parent (Peter)
> ---
> =C2=A0drivers/clk/samsung/clk-gs101.c | 283 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 283 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
