Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330992749DA;
	Sun, 27 Sep 2026 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542493; cv=none; b=IQ3Pel64ll5ZpDyprn69aUdeoQozDXP+V0rNiu0PYaAguqWVFPErAV0V6RPmRyToWZfSY4EHLjXXFO5bu7XfaAUKZgdkl6bsIKoQzfh3lB1XHgZ7n/7yLqEvL31CFn0Nk6K6Ba35T/zNTfMQGEvklL9v5yBS5wkrK6Inp/9fmlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542493; c=relaxed/simple;
	bh=S9/QhM/37a1i0wL4uKRWX1bWF6Kjw3MIZ0fO2jxzwhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z/Poh/RO0AjE7BDYsXktabK9FkNawBHh/We+Oj1jnvCcJ8q4CzRHsHS5G2iMCEPs9Ydppn3iFZL4KCP4++uYtah6xh/uU5AY/24W77bel4yvx7AGOil2chvAI/oLEz2GgWPpfGtZo6MljnqmOLRHmnaWlR/ipecuvNuk/hrPoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cvff8Dhf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cvff8Dhf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2C51F000FF;
	Sun, 27 Sep 2026 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542491;
	bh=S9/QhM/37a1i0wL4uKRWX1bWF6Kjw3MIZ0fO2jxzwhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cvff8DhfV5LWNL2Frl9Sa5bla4kWKZb8jyfN2/aO4JIMvwti+t6BuT9ZIdfHE6iiw
	 YgaL7BZr1PAf0tVt2bkMr3UTLH33xjttwiPJHNuZlfO9JPIcZEWX18LYcKwP9cKN0z
	 9T4DAeSG9z3KwgiyHBPYhZbsGfej7ktTZk7I5pSUBs2EAbjz9Vg61ME63IvSjqcMvp
	 pnzAsgoJKWaUdAjdFFJsoL6Nj8hirh3fdBwFyXOX8AL47aMu/58x6Pr8clH7mDmfWl
	 uzsMvQMTV6xU8R/iOdb2cz7e0oGjsbrdHZKOCUc9voic5+EKkVcZDJF8dr/HzhnCma
	 nGfxChvxIo5hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/13] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, olteanv@gmail.com, vkoul@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-zx29clk-v13-3-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-3-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:54:51 +0000
Message-Id: <20260927205451.7A2C51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The clock controller of the zx297520v3 Low Speed Peripherals is
> relatively clean. One register per device with gates, muxes and resets
> and for some devices a divider. There are even bits in the matrix
> controller to control propagation of clock lines down to LSP.
>=20
> The clocks are sorted by register address and I am convinced that the
> device list is complete. There are, however, a few more registers that
> are likely extra dividers for TDM and I2S devices.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D3

