Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B63A4522;
	Tue, 10 Mar 2026 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110856; cv=none; b=b6JaIYo1St/5w5pknx9IWbCmDhUOBbufbdZj95oWZoyq4S6p1PIIYogpqp7alhpsZwiITnymRKj71VD5rHbRm4CqhTWgZRwphKmATjehU5ElDODfre5NP9MLQJ+7N3pcxZPC/c3Lzpu/yHZpQyyYgtV4laf18lQ0j94er0XA/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110856; c=relaxed/simple;
	bh=B0/1bU5zID8Qrgp1bqvLKiKsWfx3028CighHJzAxGP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzkiJ8/tsWqEJe0zpsAETaTe+an18x6lRG/8pXYRr0hM8FKsbOilEGTbYh6X9UzqQ7/Dgl0H2N5wr9Ral3Dn5D0EYHky96qoVmpRA6HbgIFepChqi6EuzGjk8qdVKjcgFzaUBqEBN4SygTpISCsOhSWa4vIHQUuEbWR5oVkRVKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecvzii/z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecvzii/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47397C2BCB0;
	Tue, 10 Mar 2026 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110856;
	bh=B0/1bU5zID8Qrgp1bqvLKiKsWfx3028CighHJzAxGP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ecvzii/zMVo+sD9owtpcOdbfWg9XKgCf1AEkAMYGQUvPALOCc1zujd2STk9Ffx5mw
	 tgIKYBVCq71DEnmKBn2i8N07BQDjevs5Xs/gsPQ7qw5iw+PIdDASiLd8VFcCxZ8mml
	 ZmUJHQtv6OLBxYXNzC7pJ26XqFLMq7Zym7t8XjncsrqjbiWjzXQ1up/VmYehvMHWOm
	 xDPyoaTxEvwY3gqNRf/0uxFCKiuLCdENzEti3lDVhG9+UFk5v1tk7YO6if/htVGGyx
	 Gp8Dwq4LvWpnsWnpQU4URrYhLBcQaj9z+JJG1Lg9LwRwS6cRMwY4XxRKmQIT1AxIvZ
	 0a7WeIbGeNcGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
Date: Mon,  9 Mar 2026 21:45:39 -0500
Message-ID: <177311073293.23763.5142459029233496147.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303115550.9279-1-mitltlatltl@gmail.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Mar 2026 19:55:50 +0800, Pengyu Luo wrote:
> The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> byte_intf_clk, the rate-change propagates through the divider up to the
> parent PLL (byte_clk_src), halving the byte clock rate.
> 
> A simiar issue had been also encountered on SM8750.
> b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
      commit: 0b151a6307205eb867250985a910a88787cbf12e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
