Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C63BF660;
	Sun, 27 Sep 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542650; cv=none; b=ddt2U7DCC094CmX7PspW5OIv1rguDtfjwuMtE8OGV5OVW0CPa0Fvxz9+mk8N3xYUn3qRKnB0RtWRWVtOjLdVHtJ+Lyktg5Ruw8k8weAQCfPbveRKLFbG1DpHi3wJv9DZ3Y9sUgrcfR5U7ZYd0QwFlR0BMbmoMZaBAYi9H/t4Wcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542650; c=relaxed/simple;
	bh=pAV2/m4s9s0DycIjaLsUYzYqAH9x2316qRLAKaf1HkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=arCP3PKvkxoJkTw6ACx62EOVXsfAgMN7bdhNMKCai+EBuJZIOShrtH2YRJD59Quf9/k9SU1O46ZwFADWz2PzJ6CxsbyXkjZKPFEZ4hKRNtjtU6MH4VaB91hff7RJaYqEK9hoPm6AFKgGZ2QVuZrAVpuln4Dln0NOvt8ZL81lJOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzI7l27f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzI7l27f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935741F000FF;
	Sun, 27 Sep 2026 20:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790542649;
	bh=pAV2/m4s9s0DycIjaLsUYzYqAH9x2316qRLAKaf1HkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jzI7l27fQYjr7Tg9ryRjuObbIgOFDzgz2BizWts6kcBt+w2L1KQ2hozeoViU55d9T
	 QHv+qVrpEYtUWNDEX8EWhTqyIB1ChU6SVcyt/Rt378SEsEuaRSE9o3v+gVkueKbLhQ
	 h6jZ+ttUoicxbjbgwSBpRnuOj5qcuCR1zX7JFq3t9H2p/O+OIwez+EFHSb93g6l61H
	 2C0O4QE4TXm4LzN1IKofjTviWv5twNJJTMcm8cL6Dv9acLA2DuelTfUP5KPxkY7MnC
	 ge/fCIWBCnSgp9/xIEn6C2EZrUeOsEaWvkWhH6oyMqKrBCDEb4Zh3v27r/fEZD5Wm0
	 bNC8cCjgUUG6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 13/13] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260927-zx29clk-v13-13-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-13-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 20:57:28 +0000
Message-Id: <20260927205728.935741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This patch adds DT nodes for the main clock and reset controllers on the
> zx297520v3 board. It replaces the temporary placeholder UART clocks with
> the proper clocks exported by topcrm and lspcrm.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D13

