Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748561B87F0
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759868496; cv=none; b=jixhRdl1UiL5QJW885y5Q2CjMZ1hCxvCicyvMyiF5T10ckxaW0oG88biKy1lJyRmO73nwU/fpmE3KGc/bgWS2gD8V0JwigKuTqG5h0gFxh5fQUA0g2uUSpEuzYLNyZMezeiVo6eEp4U8k3C6qyKf76IfIObnnfgy1hxnwCW6Rmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759868496; c=relaxed/simple;
	bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUZ/OsNTY2WopVoXBdzrtVmHHjzqO+0erGsOBl432xr6nbAYMeWjJm0BEntiI9/OfTsgCLDhXm52FmKgyZHqxok8Hy/tqOtCvKq/zCSKcn/k/SNVnMu+HDKsRIGitWDiTU6+UD3Sz63+lYDntZVPqMFss3bWv6LVq7lx7zTHZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHQtwXtJ; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHQtwXtJ"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-64c7c78369aso3323819eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Oct 2025 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868493; x=1760473293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
        b=hHQtwXtJEEpxiy2cS8AfLKG6xMyZxsA6Brt/B7Pz4bW3nn1/UByh/OWZUexJZUnXl5
         sVOrV0aU0jFZyzdZ/QmpdsU3X235GeiZhQ1PXVUBOiwACIDN2S3dzM/gT20qJMyWx+BM
         FNPrOuNYx1x2hUHqJ9Hqz4+ne7g5v/RD8uJJfEftNUbmP/S3jy081s7580w8iYI5KPtI
         FK/lzh2dp4FKJFkf2/eP9CrlWD8k6TzKcNG9Evz5/i9qEsR8ws461flW4ZuGPmnAdtSY
         DxPI2dK/hH4mzJM8pp592lfSbrvolnUZW0PITfFjLfdOVxnaEI5tAC5Qqjjvc0F8jze1
         mVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868493; x=1760473293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4kdCtbMpSolLUWzyca+TrSgBjxKOUaqCLIHEI3NSpw=;
        b=aIFIyimp6mxAguE93TCIRTDh46zQxIf9yJaUBhggCFZCUZTx4J+EIq9ZiF6OvyqcDH
         u3tFzQ5xptRcvCMBA0MPMSH4vmNDx7lN8kNDYzehlXZtfD9zC1RI63Pzcf8p9H88PDYi
         1PEWE3zxyKkOCvx4XpKG4KQbENjMjX+HSonktwyZn0qO6m7CQWvZDDZKFaQC+ICc/DL1
         RhHkpnYhQw53sPbrXLy6/8Cpg5Ly7I5E7w4McdydlG+uBAClA0wvrEsebuXD3Ge+wsQO
         L4dwWZBjmT2BZTT+mrUj3i6+QeG/ny3LjQrYcfsW3yOogFSIHolO9edQ05CVOq1qu0U0
         urVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3nics+feTMANPpo42zfzGAsXknOF7qeWCMk/Kja4YA3ZYa/vjCEnAvgCfOb1UWFez4C7Bnz87ZbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/4fN3KFcNm1CXpF1kVrU1jbV5nsPKPoonGV/ZQ6Xef9D59psJ
	pFp+LX+UwozUi2FiRiKEcp/L4GWivSZ6/bh0ZDLsaAh7DpxGOGn7ZeH2OsMy8Hlk7FDjkJSCla9
	BsN5+h2lGmtgph2aEv2AsV+N55S15Zu6hSfBrOLR0Qw==
X-Gm-Gg: ASbGncts9+YcQg4NsjqgCMIKpEm1dWU5GO0JL/eE+CecwKCxvfceJr4Fw5CuOZWY80Z
	5M/PIhEfrB1JErA/pEmm7kpnKBFw3J4Yn2DPM9PDsfzmov3gGzWncNv3TVMlwXvu1ZcRvcXRQFr
	5XtgI3s1043enGT3BC0LjJR6eBBEWDRYUdY6YS7sy7oT4ahXej/EAv79c24LFu8Ui5HzRFIQm0a
	ovz2R4hetIwYfm1N2XGk9mNop6YNJSxUbVXLQ==
X-Google-Smtp-Source: AGHT+IFpXtTl/XW7xSv6EAre9JtZi5PYEJL3Nxxq8Z5J/VjHzSG4hRXvlO0e3SJ/ojRDNDKk3AnJrSSYwAUNIg/KUXU=
X-Received: by 2002:a05:6808:e8d:b0:437:f364:8361 with SMTP id
 5614622812f47-4417b36da9emr428435b6e.11.1759868493573; Tue, 07 Oct 2025
 13:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:21:21 +0100
X-Gm-Features: AS18NWCC9b83T6F2zFo4-esWHDAnbT_8yqAmmeWUhP__nUnwGaXjsaGNRCUZonU
Message-ID: <CADrjBPqAXYBsjPaG0w2tdA7EAW93x=DU_OxrEeyuGKByhyG5vw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Oct 2025 at 17:03, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
