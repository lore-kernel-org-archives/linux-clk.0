Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5AE3A7839;
	Thu, 26 Mar 2026 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521724; cv=none; b=kWgcC1P4GL72xkU8IqcpuM+NOdYAlRUFyh0R2M1+pdDsTqu00Mi51qTkmBEgA7POeXt99ZFI7hykHqrWEeMZvCYqikMGcS9mYReoaoezTzZRkk+YDeGrMGYl0Wd1GopWN/XidqyNVbz2jWkipP6i1na2EoU0X2X0sN2wwV10XRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521724; c=relaxed/simple;
	bh=xgtvBKdeurUZpbpqxuiw2GcuiRVlq6qIIOG2yex1h8s=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=YJE82jyfsuLrcFFGbgbEeimmAGDGFONr4vdQRg4qMcH/+T4ldLD58kgxQriW2KHl1UpkUvJACvDHzvZJaLpqqsk/FePyO/aD2r1YAuQ4NVPHyJCG8ryeNnXXUCdvBmnwUX6gDmnXqlxeqGeapv5T+t4FUZxNR9n+nViCW1GOi4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXOStMMz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXOStMMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F3DC116C6;
	Thu, 26 Mar 2026 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774521724;
	bh=xgtvBKdeurUZpbpqxuiw2GcuiRVlq6qIIOG2yex1h8s=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=dXOStMMz6LmLag+hONMc8wCM964dpaoi1hzo3PvGYhtUEj6iwvGlEOpoRDX8S9x8T
	 /5IkSS9jqVYqHkWPvUHzTI5dES5GpzDHUnMpFSHSDHZd045ioBYdTYCpvhLQqtLbO1
	 CX/VHT7p6RAQJW8NIcrCWxZ9VbUPq4BQOLrcfUWL2UTH2rpf/nyB7GqRhqlB1ugaft
	 5+eFBKiXVhrgtYIdwF1juvqMt1unGERL5PnDtLnyg5KiZ/om6ldcVaEwvMdLIQuzGW
	 YbdHxgB929I4qYt1A9TQcIaqR7vl2bplL8Hf63wwZUVjZGIi/XrHDZiF0L4sfkysRz
	 oLjK6TO2gkjGA==
Message-ID: <633d80600f9435b36e333899a9d50940@kernel.org>
Date: Thu, 26 Mar 2026 10:42:01 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v2 4/4] clk: test: convert constants to use HZ_PER_MHZ
In-Reply-To: <20260325-clk-docs-v2-4-bcf660e1ceb5@redhat.com>
References: <20260325-clk-docs-v2-4-bcf660e1ceb5@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jonathan
 Corbet" <corbet@lwn.net>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Wed, 25 Mar 2026 19:52:13 -0400, Brian Masney wrote:
> Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
