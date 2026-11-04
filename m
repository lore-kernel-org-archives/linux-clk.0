Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804405;
	b=Kn3xpR6jQ0lk8xNDgQnPw75HVx1nI5YdtDxfPw9PIyfmJx+AJr0skRKGo+Hcum/NUKga
	 eEV6htnWfWfwQyey8eDZ5QtjhwT/reaYyVX+/olvhIY+O1KxbMxBTOZyWqvhmHWGF+pqT
	 K8Meun6wDc+gGZx10GEmzqCE/7mWvY4eUY98e0GQjmZuuAWbbNs7cf4sYRD3KJp2Jso95
	 Z4cjR0B49/9Oxc429ZEV79mwISPM/RKvrSQ/c2sd6lHpoYiHUziy70wM6CynoCRef/Mnm
	 aQDKbXrY5WpREqZpmiK+PfhPwtn4487blcpGfs255kdyxEouLeK19J2j9r0G9KzOmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804405;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=j6Lmm1Hn0vVGy1edj0ZEjgYqhILrVPlHvC3oCOWpi7M=;
	b=BZ1DptbYefzP+bw0qjFpqvBeebD1Jsde+aH0pkfuxE6J2pgSuHT0/2V5uVQ0VNpreEjP
	 gvsMGQVgDTeILGnZ2yB7z2OCOL2j5RJPGC0sUZQSEdADZTJNm4ug/mz4l1oux294Qfl2B
	 5EjMn2yNfalEJr2SiDLgjIyURwh8J867DhBC/4gYUwvimcQ01QokwHfR63yRnyKX85AgR
	 2o7R+pzvQbNAchLqDcV3bwEWPUDpdmOMrZIXscaC2TCJYKsS6weyjnpGlSye28LnfoDfb
	 Vb2lKGXBjQeK/t4zb1J99yxbpNmR7JJwG9TOwjtNkE5AQmLUH/QbVOumPDTFdKBjY7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2FfGEza;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9D606A31B;
	Wed,  4 Nov 2026 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2FfGEza
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC551F000C1;
	Wed,  4 Nov 2026 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804404;
	bh=j6Lmm1Hn0vVGy1edj0ZEjgYqhILrVPlHvC3oCOWpi7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E2FfGEzaY+5pOzHmP/Qxnev2lkJRvRtWfseKPiVnC5SyQQRdX107lcHXaRuDu4dvc
	 01x9DlOLwXIKCTDZo7U68AomcvrrsY//bJ86MFgKiillsjiABXwMI7n7IlB7Dkc8OT
	 fCXwaSJndHc3pgqcHQaOmylqRE4z0SgZGiIv8naOuT2dustP7iLQr+CP5qQYmBWPkB
	 lcxMrqK8T9uAK4dgutBLjd2Omzyhi2j9jNMSmErfYY9mxGylwZGf6bcoOqf357N16Y
	 kUqaMpic1Jn//qEiji8bHm45Z7AKqdnrmWBoWXNwAPuk+ogVHfhg2fOrq1FT1vBLPt
	 +diG578y2m8yA==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261104145118.952453-1-robh@kernel.org>
References: <20261104145118.952453-1-robh@kernel.org>
Subject: Re: [PATCH] clk: hisilicon: Remove hi3516cv300 driver
Message-Id: <179380439179.620564.4189393090905207161.b4-ty@b4>
Date: Wed, 04 Nov 2026 09:59:51 -0500
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=290; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=q+c2CJOAfFyU7qIx6L79cH32JQkactqk07DEdp5nXKs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJee2Szv/AKeLrwtsgit/132dj3u2zzlYuSS55/vbRqn
 vLi5jCdjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZyn5Xhn7m+GsuxteWiuw99
 42W7p/tjxb+J25Kt02XfM8i8Ph+kfInhD8+ErlfFiof2qAgJTzX+a1NaqTk95v1qv2fTJHVK98/
 wYgUA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 04 Nov 2026 08:51:16 -0600, Rob Herring (Arm) wrote:
> clk: hisilicon: Remove hi3516cv300 driver

Applied, thanks!

[1/1] clk: hisilicon: Remove hi3516cv300 driver
      https://git.kernel.org/clk/linux/c/3865d0d4439f

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

