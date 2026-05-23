Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C3374758;
	Sat, 23 May 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502832; cv=none; b=A1Zyt5dS0NrmkFYXTnFQDWYTIiLD8pRG2nlgvnuq8ethoOGddncTng3471M74lKlgkcAOn3Bufv9cgH8l69z5G91Wo+bv2/8+VP8n3Q+o95BW6q0ptx4Beql+Oo59JmIn+gOye4F7joRKD5vhlWHzEzpOaqkrsKVXl9Qk2MII+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502832; c=relaxed/simple;
	bh=xgYCi3qkmOgaHMRhI/J6YKjD1P2TI+xIB9KtSqVT+hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTdzbx4sn5tjI9KjpBoeqbblVAk36hrRZRwTvAQ54f3Vn4gBwCLBBz928LB+GV+6WK1k9UyYy6/GcIlQS5h4/H76YPNXDvKx33Y9tpXNQHhARJsSW6N5L+PHiclHQgO1WiQWgiTROeX5KY8l9sn76aMDndTcjH1LSXmlwWe+c9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLw6CYUy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLw6CYUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A677B1F00A3C;
	Sat, 23 May 2026 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502831;
	bh=YVIG0fnPQdUeV+IDA4F9T9rSBwFSrDOyYgCZw1WBV08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LLw6CYUyse/+jw4+E6VhkDBZfEJ37vnkAi7zEjkV3Smk7P2FH3QI+QccaTHZJ2hoy
	 sjlU8D6MFSA5Gim0aPiMeqWHqtfq9sTxGWPlyDPPttGDVkuy/GinaNaDZ9snek/ztB
	 SiQXscJYubYlm4cD0rM+Agv2oRccdvyGWYVQSc+d52VV/LgPL9axPf4AT9nrcaZq2o
	 gusYMKVPsa2uxhg8+yI+cMfNIQOr7S+VSXv4QHZqWMPMD5SEh1cN+Asd25oyVHWCos
	 npGm3lLdWhTyCbh1AYRSOilv2oplQ6TADwu+HCNkahbT4yTeD7movfogeoQuJOuPRE
	 LSvcp/xvUKc2w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
Date: Fri, 22 May 2026 21:19:58 -0500
Message-ID: <177950280368.1097700.1835328994684545490.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303150152.90685-1-mitltlatltl@gmail.com>
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Mar 2026 23:01:51 +0800, Pengyu Luo wrote:
> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> Gaokun3, the image will stuck at grey for seconds until msm takes
> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
      commit: 5285b046757844435d1db96c1b5c3a6621b2979a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
