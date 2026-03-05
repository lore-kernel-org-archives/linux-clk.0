Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AD377EB4;
	Thu,  5 Mar 2026 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712763; cv=none; b=YRGH7AEOEOKJS+3eES9eEYCG0eX6uXVig/4pJE5aiUnDzcNOLugEIPVFiWOnu4RhSR+yTFxGImSJkqJjrOlWkLcjS7Z5srLIDUN/1hfQeED49XNDarRN+TO8OkUL2GqJewkEPCjfLaVtdMEbD6giADFeRn7NRvVKg3O1aT1S6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712763; c=relaxed/simple;
	bh=EDTonIbo/AtMkuSr9cxronG5ty897y24tfTeRaXVqko=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Na2oZyeNa2JmLeywXjsnP6HKd0jEJJ/cpYIeiFet+72VRJkDnul2nf3hzOdfjRSooB32kLXv0bnEai5ezY9c7E/AlvVwdYCnngTGrlKkP0Y6tGOaftr4B7j0/RSKXFpGFDVqnweeYdTHSbcYxRK3/KZn0DSqfr/zqV4XY7fuwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQ3TQPnc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQ3TQPnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B58C116C6;
	Thu,  5 Mar 2026 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772712762;
	bh=EDTonIbo/AtMkuSr9cxronG5ty897y24tfTeRaXVqko=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZQ3TQPncHzx1UDy6jIKGldGTZIq+BZ+oWxhiWGRQ14kev5DsoLweArXVXg6Mn5724
	 Ts9tcdxwhvddoKI5THrg93owNA4DHjG/3ZgcJqSS7mJuUaw04GYcFZW9fscvjttrCG
	 s5ecmgOyBnEFyr86Kpg3q7tJbWoRHKPrF4lDKR7njjLAnBhQAy0hTY1eBlMAQGfLBe
	 /qrdC9OlSlo+gBHLt7Yf2j26eHv3UgcB2QAelVQ6IEwIUS+QTR1VfJU1eA58zdWrQ2
	 Yq5MaaCRsmeXAekOqUlaCzcb5rWuaNWBu/rvJ95BsZQpOPWnHiWs5daJdsN39g8ukI
	 Lyg8qppzKkZkA==
Message-ID: <a6409528b56f95f34ca560dcaa2b5800@kernel.org>
Date: Thu, 05 Mar 2026 12:12:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 0/2] clk: add kernel docs for struct clk_core and update
 tests to use HZ_PER_MHZ
In-Reply-To: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
References: <20260304-clk-docs-v1-0-fee468db99f1@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Wed, 4 Mar 2026 17:51:02 -0500, Brian Masney wrote:
> Here's two patches from my v4 clk rate change series at [1] that should
> hopefully be good to go. This series documents all of the members of
> struct clk_core, and updates the kunit tests to use HZ_PER_MHZ.
> 
> Changes from what was previously posted:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
