Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169308;
	b=iONqtR4XyG99TtC0eSfdPLHIeDIvvYHIji99lX/xWHZk9WiAWe9VqnrnnOTUhSYNCASa
	 inR7izVKz6a86+FhN8jtZxaVhP7rejLbIfxvY6MXqzV61hJKxIcF9c5RnQz2hICUi563u
	 NGPEWK2RS+I2+kf3S7G1vmywwwHKFrrspHA1a72zIuv1M456zkEGul/DhTLbxmjR5XSz/
	 a5hCz4+ktq8h26+yDEzs7Ply/oh/lcaCodiW33HlIDxjqKIMyH5M+MWrrU5r2n1qOh+lO
	 Ihw0UQlkWFK+zhSlWD2dArvlGgl4UwYLfYtM//03RhfpjMLCwWHszDpVvb7uDvtskFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169308;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xy+ShvKLn03o2on8c5SDhJadEgeI+BftnXytN9Bg5zQ=;
	b=labxMNL401BREZFrTjDYntFgnL6vPXv5hpq2uJY4t6IkzzhIoFtGiDTKXDBD4J0AbhfO
	 4azzmBTeOumpz+PPj4ASN0zU9639kgjYBC16XveZuSsIMfbigB2uPhxp/1GPPWFrrQhq9
	 PsVZRnsxcP4wKk9tB+nCwMs9FowuUflfkFyOkMmDfjjirKlfBOsLtKrsM2QE1PQYBRSaS
	 kL52bsUD0ab5MgKTPOaJ8zfy5uOu1MOeYICFwPIFFbAtxejghTNkjOvxZY8wrPj2dLUfI
	 BkBKdHzoQPfahlj5BZ9lzvil0g3DNVWkOVgOTY5JNZnvaXUhXPJyficleauGqjcXaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n28Rd5YS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F74606A31C;
	Sun,  8 Nov 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n28Rd5YS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432081F0089F;
	Sun,  8 Nov 2026 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169308;
	bh=Xy+ShvKLn03o2on8c5SDhJadEgeI+BftnXytN9Bg5zQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n28Rd5YSD6ZzbZnYLmVkafLy1vDKRQpOsM9PYSrmeFsayt1kWRQK/zkIsmGSSR7PG
	 B60N2cl+NtwO28/utlDk79GLCSh2npwD49pnj37OqwGsXtf1hjwZ/lUw8/huhD37ta
	 w0fFuAKqxO9vwaAKK7oYRj+V3wl5vf9ettfm9Vv2sBh8bI4942wpfpkREVNj2GBM8u
	 6YwsA62MbtcVDldNsob6uzfguiYwpSojQNIrRXfL5JCIKk4wCdXYdkW4JVTTyLkYY6
	 yswCyZv9vWAmKQl7mbHG5GSpR4jByTCsJguBXYYmDKu64epyFy6Av+DQWQxcXT/Kgy
	 0JezXC0PMk3Iw==
From: Bjorn Andersson <andersson@kernel.org>
To: sboyd@kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Cc: mturquette@baylibre.com,
	taniya.das@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	nitin.rawat@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
Date: Sun,  8 Nov 2026 14:19:08 -0600
Message-ID: <179416929331.628393.12470274036795271471.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007143716.2161-1-26rote@gmail.com>
References: <20261007143716.2161-1-26rote@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Wed, 07 Oct 2026 23:37:16 +0900, Joonhoe Kim wrote:
> As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
> FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
> configuration is lost over system suspend, and with MCQ enabled every
> resume from s2idle ends in an SMMU fault and a host reset.
> 
> The UFS PHY ICE core clock already has the bit set; set it for the UFS
> PHY AXI clock as well.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
      commit: ab3c9fbc73091b3c132fce5827ef7de2f5bcd58a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
