Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBE3321C1
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983084; cv=none; b=pmTaqGNn4jga3XEoUwc9davFJ179jDDVa9foKSXvv2R16UZicbZrKMRSbpeQCsHpGMJvUTeP+jAbUbkoDrXT974b93AkhoEzY4M85smmSuMrwYwmhDuopOGrwdUfC2BkU05hFRvUEOH9JhjM6cjzFIycEfsTIUwkToOb4ozWYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983084; c=relaxed/simple;
	bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cppUy67ztXTPaFsneHK89ipdnIUdVfjPvkeLetpBS5Vngl/tg8YTMIpjraKkgrIT7S3D+o9i73bYJ/JPT2fZS7PqhG/rMxzKP8jhedwAai0vS4U8bGivm76AsngWgJamBbBry+v9wbdUQRxZM4ZEg+MKnHZ0iHhVg5hxiWBSD9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB6sa/bx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB6sa/bx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so3019346f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983080; x=1761587880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=TB6sa/bx5bkTjJ5MaRhcpoj6Tf+mFleUpkzyR1LtkRSW/kXnqrrcGWLQ7C9+UprhCu
         K1XY1qd1HVhm3OvgiCsqJNj0FM4j2JMbZEDSRepw3+TdidZRy4/ZurPhN5XLQYdrbMmO
         Lsn/gkkqUQ/7qMWdk3UfjUTRMGxLLUJTKxihy2FsmjW/5+zCubXFEEs+/IaRPFEzQzEJ
         wJ7pyfU1HWpXxsuNJTR7E9RGoDFMVintFSrrcBougdWmQv/+YiDsKLoHahosFgX35b6R
         9i4JyJGfT0SlDNxpF2MpizZ67ZIo8q3L3+faAIJW6gXLbFpDbZUvzsbnJ8bJjvb24p4r
         LE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983080; x=1761587880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=CKBcaQ5nuBhc8ur31PbtI5QKL44ByrBeQygI7lynbFFVb4vfxcbFDNqZdGwFcKSrtS
         McZiBe8b7WVizCjYsH6DRoLN1K9CUx8M3mUE6tANsd1r6RPPeyZ5FRbvrpsrY/DVtjU+
         tgqYo7HVTlnMt5wvuj4RZW5FQHk18bNyIdwDerL/+SBrKYSkZvw6cw3f38PrbkYjfAm+
         6gDOA+2lGLk2rZgZoSO2TGZgxUF+fjElARznIMtylY3yLVtbE4P9IL7gpcT/TktSmNnC
         wNTjLx8G6zQO1PV0msXHhhRQHIT2WJ9zdaT3PEduYMmIavvhInVFl5jJFUPloOnC4vVF
         DVSw==
X-Forwarded-Encrypted: i=1; AJvYcCWurkzod9iXBeWtcFItOG9Uwy7UQteW4kowRZW7P9ggq6kgGhBpU4T6L6dUVlb1e8QLfaxKOsocX6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/zm8N0Q1kaFs+Zf86QeLsQo/dUXZyaY07nMPOuB+rMg0aumo
	jR0xsjrc0byo93dcpPTdl0Gp3FLgw/GJkXOt3cDwBarDRx/QFXmioIBk
X-Gm-Gg: ASbGncu5zeW+4xHmJrS7ZwtX9gPYhcrn2mhgJ+spRwxjKeoTzHZo4d94rVGXkEXYXcI
	M8XCgrRq2027jgY/igq6vRBGv7H4FR2svJQprM5pkKMn1Fsb+Lxe8QgTh+JxweMU4Znbro92T54
	g5Of/F6vqeJIpt8SSVh+jAscbmWyQjJr0lhiNgn6NggHzxtegRKz4afoXdFE9YMF3UOR9nENxOe
	iF+UTnu7fipBJJ8J89tsp3DG8W0OyLf/smsn1wDsE8ugTN3oPa9OVgZQLEyins7RTfvmeUUbS7m
	o35IBvonBMW4SsxWWmshzj2PkxNZeJyUIsxnpaGoOruC/0o5sL6TXtnhoKGsyMnFjvxXEOkBzA9
	gGPjSDMKqNCelpSzgjynLtP4KNPH/9nnoA+kVI09oXRbzcQD5HWiUgFAwHl8/XHfpzqL+5iTZiB
	LOSWnKvJz1v+LhKXoQQPmAx+BBJTLzVW6BAMyUXi2v15XUu2CZHE1B2mBTpThEjnSkXEsV
X-Google-Smtp-Source: AGHT+IEQQl9YZkR1BgzZ6Z2Nufpu9HBikDewEvyF4EuaS29j/RILS2DM6SBqWX87g+1TkKzsAinQ/A==
X-Received: by 2002:a05:6000:705:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-42704beea1emr10367539f8f.23.1760983080172;
        Mon, 20 Oct 2025 10:58:00 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce08asm16294878f8f.44.2025.10.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:57:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 07/11] arm64: dts: allwinner: a523: Add DMA controller device
 nodes
Date: Mon, 20 Oct 2025 19:57:58 +0200
Message-ID: <2324646.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20251020171059.2786070-8-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:53 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 has two DMA controllers. Add device nodes for both. Also hook
> up DMA for existing devices.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


