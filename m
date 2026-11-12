Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490280;
	b=mwiee1mBGN5Bz5LCZFAClD2tPQtIMwAQo0jCOZRyOQW5jOyGg49/P2hIJ9HPOLJwBXXT
	 gIj1tziRIKcKHn5kWHq+WAYPxjpsPuReyWZOlKqQlLAA8MY9fDqzM0wgwzS+mzxY/18/o
	 7KdVFG+rmf9fVqFtD2iv1DlajX77JqvS2mxDXZP1MXDF3+qKfrgtCYE6CmGmzotg/Rwwj
	 KgqR6zDZuEfOyV9ykAI6EcNAMlgV8HHkqmxkga+kbPlvxFqzkvaojqBPSkbolr7c0LZgS
	 jkVLlahk68hS8+sGDK55uBzQnikVrsIp1NtzzkDHQlfTLzRLkroPBi7WWGqln+T4dhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490280;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1fM5NXzkTcAWiQAQgLoEWCpD82btNGq5kH0npBQW3Q0=;
	b=QEZUhCzCJw7aFFuIAjrVGlKt2E4d3bOF8YmB/tTljWcjwm0bZQsOGCmNHRe0rst/se4W
	 LynIjK8no6p57CqSWy5/00Qo9As9hlY6JKxB9302/bmDyyq61bPUBD5ty/SyzYrKn6UxS
	 VuMvFgAij2RDKV5JFzbBiD1zr6Gehz93yuIAH7k7Ou2Jg4yL1/m2pvusaxEeC+iYRpPSD
	 6Oo931Jk5+hfxEShfNVw35V0LlAzZ54Ys4O+C/IoC9UeUffB4nC3DL/5NJpdBRzRpe8d5
	 1UGH1jdur2pc32gzbW04ekzZ8nivVyAngRjc4SVQPhbDxRMrFWogUJ57CjCnFlkKkBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESsu16Sc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51C2606A332;
	Thu, 12 Nov 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESsu16Sc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B9C1F00A05;
	Thu, 12 Nov 2026 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490280;
	bh=1fM5NXzkTcAWiQAQgLoEWCpD82btNGq5kH0npBQW3Q0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ESsu16Sc8FXowF7wtVWIjgg/IKMQ9/lh8S8ufwkZ+iQlQf22rKCElrKjgwIInuZN3
	 YOiVl1Mf+IJi9UzCS9y5yRrsJUpjtK1MVPvg0h9f8S3k2wxwAuB7i7o3DpcQEKXYpw
	 ceMy4vtPUKSknw2w99nZRWWa7oBoxH27Foxy4UtVKUTkKxtKK6YOVyiAsigswNrnr4
	 1GQU+qNxc+DxpZLBgcZL98zfApNqZ7rYrCUDd2R0ixzWBQvQHeiTEFqAogXD/l+eVk
	 d07Yi/4k2c9V0Yg+/pT2wjjkbnDjOgqh6lFcIYyCporMVDmIxtiCJtEY4xwz6V1qeQ
	 VROvOC0225paA==
From: Brian Masney <masneyb@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Brian Masney <masneyb@kernel.org>
In-Reply-To: <cover.1794287244.git.adrian.ho.yin.ng@altera.com>
References: <cover.1794287244.git.adrian.ho.yin.ng@altera.com>
Subject: Re: [PATCH v4 0/3] clk: socfpga: register the SP timer clocks
 early
Message-Id: <179449026823.1202846.5650024380038955514.b4-ty@b4>
Date: Thu, 12 Nov 2026 08:31:08 -0500
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=Ik+ShRUAdc9W8RdMQ5+RUBn3TDZawyttamRtgHJtvwM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+7l9cx8HVtV56ZdrmuoYVCfnTZN2frjGxi7/wsEMl6
 3FvZ0VbRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5r8rwP/Wu8xGR11Zp5euk
 TEuWqpvESdV+3fqU75AJp4mkoS2bMCPD6lNrGCrOaT5XvF9gccH13Y2lLYGLX156lyh+7t6tN6k
 b+QE=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 10 Nov 2026 14:12:37 +0800, Adrian Ng Ho Yin wrote:
> clk: socfpga: register the SP timer clocks early
> 
> The DW APB timers on Stratix10, Agilex (including eASIC N5X) and Agilex5
> are probed through TIMER_OF_DECLARE() from time_init(), but their clock,
> l4_sp_clk, comes from a clock manager that is a platform driver
> registered at core_initcall(). The timer's clk_get() returns
> -EPROBE_DEFER, which timer_probe() does not report, and the timer is
> never registered because TIMER_OF_DECLARE() callbacks are not retried.
> 
> [...]

Applied, thanks!

[1/3] clk: socfpga: agilex: register the SP timer clocks early
      https://git.kernel.org/clk/linux/c/0b95e3ec699a
[2/3] clk: socfpga: agilex5: register the SP timer clocks early
      https://git.kernel.org/clk/linux/c/a13f8c1e4afc
[3/3] clk: socfpga: stratix10: register the SP timer clocks early
      https://git.kernel.org/clk/linux/c/51805c5218c7

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

