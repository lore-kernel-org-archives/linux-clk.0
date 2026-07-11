Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B533509B;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799409; cv=none; b=VeoUUzNJ/t5qV9+M0vBPRanV+OYR0qCxfOBM7WcLIu4PLDB9cPhcWfzs6MdCotFqoRWwePGpxYFJF+3eq/kxw3Ip1HCpyMW1i2Pe6GqETVjDqHNlM5XyuERt00BhKJG9jf00+6DP2Fmv9TSQNIfC3tP2t6iwSCY4u9AS3fqYCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799409; c=relaxed/simple;
	bh=hzznUv4BZKfUoqe4GCJ5xq57knHy0Hx3Hsae9vWbXb4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZbKKt1GVpnstd9PCnrEKykZSXlhJXcl+T30DXlLz9oszVorqFblQre10NMbaPA+XQFW0rcer6T2nFaO3lk3jR2Mo9/ZRpkFnUQ9ajDzE12c7BuQwZ5gZeDUlz03v+S9Q4SJJfAdXp4pieBn/nWV3TskJFWEtccFuht+pTn7KDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ6iwClt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ6iwClt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EF61F00ACF;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799408;
	bh=dYmulejeYhQJrynlJBhwfOkbg6u5F6EbX23SkcmIoQA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=JJ6iwCltqDcEQO4DW1vVefgOnaTROnvEY85uwFPG+eNtWHTJpEynImTgw50rlTCjV
	 /mctiQugYZJdWGcjRWm6kt/Fr4DZsCwyM2Os2WmdhlCCsrcmy3wTHq0e3+uPXSq9Vb
	 4KAB/FLhLjR08Vtp8+yTyVWsf7XWIJ6SwDnLgJ+lOWWWG4tMAYF2g6y3BjD0zBdOI6
	 ZZJ0vhnKHSS0/+IVGavnKKuV133Ey98T8zpWyykcAQ0yKmkIctDqlJIGc6zQ8DD9Ce
	 ynsW7mAiPojCCcG5HfNIlG4Vu0Lw/mX3dpgscTO+ZWXidD11gqugwTnERz+/+PaUgs
	 t3TG+3GcTjyVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: camcc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Sat, 11 Jul 2026 14:49:47 -0500
Message-ID: <178379938600.163099.15741001325573570402.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 05 Jul 2026 19:18:12 +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_desc', 'struct qcom_cc_driver_data' and
> array 'xxx_critical_cbcrs' are already treated by common.c code as
> pointers to const, so constify few remaining pieces.
> 
> 

Applied, thanks!

[1/2] clk: qcom: camcc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
      commit: 3fb968b400bd3306ff25852c396a05f581f0d4cc
[2/2] clk: qcom: videocc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
      commit: e5b2050ff760064c84799ad2954ab30aca415cea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
