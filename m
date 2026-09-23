Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13135C6B2;
	Wed, 23 Sep 2026 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188566; cv=none; b=O9RM78RJFCfIHYz3Efy1n+sSBUke1uGHOtIBGxdHkHH1AvTbCrRKajXvFtm2gaouZqKDLrgGKj3JKgfIuwe/Jo7wTiZyeOJpQyUeEohse4b4sppg5WzHJ10XNefRbHB3uap7KUmLQu3ScLXeXwQHEPtKaeW4b6pVIntsaeS4/50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188566; c=relaxed/simple;
	bh=Mh6RhIH+/CK7p2Vv8GgPxL3pyssay7ai/roKbn2WE5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCNhXf/1gNKPo3d1ZvS98JoBL0oX/Z74cASocV3N9i5/RkMRJ6+88dc6uZzhKsAHdomo6hOaoPaqaS9u8iujFNbH0OxJ+ty0pINmkM3FZxwCZ1g555zpS3P1bnkWofiv+E5XodZ5sm0Iwq0P7In1Lzf2PKA2+pCO95AbauuIIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKhU/qOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKhU/qOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA491F000FF;
	Wed, 23 Sep 2026 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188555;
	bh=Mh6RhIH+/CK7p2Vv8GgPxL3pyssay7ai/roKbn2WE5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKhU/qOAUjiQmaIw2IRRAp9ZCMIdr6bopgt7AC0R+cdvXeG1Iti6oVPikQ3zVZD3j
	 GwV84Mq1YItHIXoSjdr0QRblXlpebKnecBit5ELnOxHazV8qhDBi0Bu6j69hr8Bpt8
	 tI45UjjTU7AUs0YZJlamiujGaFQDLBvaHjUVGyvYL5fYrKQqqHEs8T8fBy0dZFkvmK
	 wiFizVlkZq4MK8ann8IqqPzMirIRIvnzW/153utYuixo+uwMuhJ4gICMKDXs1p3wbj
	 rlFGDUiTrYVfDQfBD+W6uJuf4sJBNZaHWXm0nHX30qDiEBstouxyDOCIgBBIGK0UK0
	 xUUXKbTJJ3ZNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, vkoul@kernel.org, olteanv@gmail.com, lee@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260923-zx29clk-v12-4-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-4-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:35:54 +0000
Message-Id: <20260923183554.CFA491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D4

