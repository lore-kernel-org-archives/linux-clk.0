Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622062;
	b=3yAI64fupr/w9TvGZVPl18vgRaULdKmaoJDSFtIlftpaLttJESKwZ0QOd0agJleQck6Q
	 izRSvSwN5kZOUoEp917QwZriK9/JZZanCkIVKGldLXPItzSfmm/DKnpS2C9FCjKjLYV+3
	 JbCp54ORKDi+eT97PY/iJlH+1rVntvvyWDtG6v+Zv4S6drgTcqf8nT+9VBJkSF/jNpjIN
	 07mb4EfhIFf8+rtp0G1EhDLPO6ZqvNz0fXRTgOSmR6sf3R8anvR7RISxPQBe3qleF4/to
	 4AF6JZcWmkfZQZf6YkhAUWM+Pj8Im3GUHXOhCeaBYe6/cCxG8FZwFBaccXGgR+UFcqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622062;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	b=kcebJwwiIuh5yik1VUL0BtdWxDDqby6jkWPGWyLMwJNmdBrqpVw3PU606DKriKO99WG0
	 8Ce0ZYJjedLgv6aN2gjhIVSNVEo3Zevu0vr+z1LXptQlthg5V7zeTiEpKfVMkQDB8g3GD
	 twmdIHtfe1lQ6bZDtgoI/6ld1VZz7UYUTiWdaZt8NO2U4Nyt9me0Sc6UD0pPrFcT6imph
	 LsQdyZ9ndk762tA7VBHJu0cD8of/nBagiOYv2Fznqf5e1YHrzrO4aCjET4ElD3U4TRIXr
	 Qn3Y97BQS47woAZrfDOKEw4rBHRRcl1y7f9ya2woqfgXL0MZzZeS0pmRjcCOSt+2rkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gez81Hi5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81965606A692;
	Wed, 25 Nov 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gez81Hi5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795622062;
	b=yHAeQKFci/GiX/U6hcCHVCyWCD1Kf4qEWADORgPfqTFWpyQbTn8gThLC24c586GM8XUz
	 7TwC2vo/Qt5kTD7aI+pxv/zNkUCEn/osCPu80foCloAcAjzUVRX94iXrou+7vQBUwRTYd
	 UA6Ktix1aZmfDiCLLHCFT6a36xU900ZgvmkYsGkgGCCYH+ocdIxo9BQjQ3pkZQ+axtU8e
	 i3hyEvnDCyBi8G4Sih8t3EeNvUdXvHLqrKJrVuNAbeuv3tgpVRH6lGeEP7k5Y+wFcQV3I
	 n6JxeWuzSczeLtiWkvoRqp+xuCri659SXiOLzMCwqwQ+4EU9EQR+VLFh8eDuZOSSWZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795622062;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	b=0XaXnc4s2k4r0t8zgK2BNnUluqx0QdifLeTRp6Fky+poBfhrxDABUwCPAGQRn51eAPhD
	 KE8I+1xsC03WEzcv8Ax2i303fRgbLgOJ5/NqcZqjlgx8ASOFvjfgxQBcPf6Fid6OEQPAt
	 CDh2NDqulzh+ysF9Uk/GeSg0rgsrbyRPMaubJqY9ylgIfE4CXSwhg06EpFTL8q+eXD4b2
	 Kx7a+Y+Ggm7q2oT/ruGFtl96+VaybfEWxIL/N2j0qreIEdtQukttncJv5pz5jwNWVulaP
	 SF0f/8y9FqgLph+cs7eYrmKQMCGBr2vDg6ChCdO5JmzXQwLQCdSva/3S24zhcoSX7Cw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 561B21F000E1;
	Wed, 25 Nov 2026 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795622062;
	bh=xMT67eHD7TWDMeWgiNELwOV+EIpusY+P5TIZAyF8yAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gez81Hi5mTfojEI9HENJRhXViVN0no7/mZ/8VZZgznFaT0o/WtPydWckatMOB4zax
	 I3CADck5MOXnWVAkhYWDDrCH2vGLMILhsdlWnmxryxLf6vtR/GCezk/wWZsDAM6ohS
	 XMRI7wiU09vyFheFOBmtIX+mg0xzMNrmgso9qJlakEjxPqWaeN3+AkWj1Lth39Gkmi
	 mxUTTOgY6ScpkRlWSGMLBaiBwMfi4ml5jQbXEFlEHjE4g5q4ZjiZLMxMD6s2iwmS+d
	 haibQBGw88Daq8QPQEraXBrti6H4kNvng1lfQTK5Q1fLVW8hsHn6QPkxCib2IDSu3o
	 qNuKXxfqjtF1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D442F4CF4C;
	Wed, 25 Nov 2026 15:54:08 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Wed, 25 Nov 2026 07:53:45 -0800
Subject: [PATCH v3 3/3] ARM: dts: renesas: r9a06g032: Add #reset-cells to
 system controller node
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-rzn1-miic-resets-v3-3-f25a4b656d71@reliablecontrols.com>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
In-Reply-To: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795622048; l=804;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=WWyo4QGHfN4nIjzzAN5Okr3IhbwMhhhW3P0Osmvu8I4=;
 b=2LqyymLuiXNhAm4QhcNkj9gl2+vFRFEU6ggYjzDvTqJ+CweD2lDoMyvjCSKlrQRuopPwuFvuW
 ivgZa7PXyV+DOWSxtu2nm4LREB8+hilgc4y5+ETsszmErVUMSwMUdVF
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Update the rzn1 system controller node with cells for the reset controller

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 5455dccfbdd0..f2bf087f7ad2 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -146,6 +146,7 @@ sysctrl: system-controller@4000c000 {
 			compatible = "renesas,r9a06g032-sysctrl";
 			reg = <0x4000c000 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			#power-domain-cells = <0>;
 
 			clocks = <&ext_mclk>, <&ext_rtc_clk>,

-- 
2.53.0


