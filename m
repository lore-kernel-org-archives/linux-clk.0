Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B778B4248DB;
	Mon, 27 Jul 2026 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182411; cv=none; b=h9rKibW3ZIXHtoI9P/iIQuOMI1Pqv1yHE3iq5eKjN+zZk8BwRnHRmK/TMw0LxiCMn+klWY3Q1Qxpxc+tXBuEpyWwrrUB0pgiJZ2oW/vTfCat61ZSMfi8T6e8K0h66a4IqYbjSSQOpSLxiLxd13UmE+MLOl3DM0+56urdQh+Y+jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182411; c=relaxed/simple;
	bh=pqe1sZociwH2W/KgusrjYzjHwPM3ph4AKMEvHrDNLP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iowiZrkKwm74y7bPbPJrDhCTe5DgLb+Upv9AIhegphF9DJ/QkyqunpuzfV3xT+hjvcf9meZuMFkWzivqLRSHQKos0Qxkss55m5dDHsuHgSeOciMSpHTsCGlrt5CBoxvDpWxYqtzF6T4q77inhWmOLj5/TYFJtLLd2uRPON7wVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebk4xxw+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebk4xxw+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459041F00A3A;
	Mon, 27 Jul 2026 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182392;
	bh=C1SmbzoOaveCBKG/5kCVa1IYcMqVrJpItxE2AKQiVrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebk4xxw+UbSLOvIIUXkJNcMLukV4QfIcHE6tWSNbHevUwShk6K19/Aqm8Tb3Tosk7
	 i0YZjwYJbHhyviI/5LEcN2K3W+bul1ltiYJ7hd87wYRH1CEUa4aod/Xe9DH/0C8J/1
	 dxIPBQk34KrZd3++tFmdBqPaH8Wyxt33H0k5oKHvVCEIYsRlys71TTFesceH17licF
	 XViBjs9T1Qku7VqesMOC/gMRMLPW0b4Y8CjDvSWYdb/b/72qPrVS94YgsA2qN0wOPQ
	 FcT0Gr2eqMcbn2eHEVnZDS3rq/8w6S4YJJGRzKAqZj0xhcWQvbB9jqx7GqQYUhpZVF
	 B/PzT8s+WPy/g==
Date: Mon, 27 Jul 2026 20:59:49 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] firmware: arm_scpi: reject DVFS OPP count above
 MAX_DVFS_OPPS
Message-ID: <20260727-solid-cinnamon-kittiwake-1c0bd6@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> scpi_dvfs_get_info() already rejected a zero opp_count, but still trusted
> any larger value from the SCP firmware. The shared-memory reply only holds
> MAX_DVFS_OPPS entries in buf.opps[]; a bigger count over-reads that array
> and then sizes the allocated OPP table incorrectly (garbage OPPs / OOB).
> 
> Reject zero and out-of-range counts in one check and return -EINVAL.
>

This issue of out-of-bounds read is present since the original SCPI DVFS
implementation. So please include the below fixes tag:

Fixes: 8cb7cf56c9fe ("firmware: add support for ARM System Control and Power Interface(SCPI) protocol")

-- 
Regards,
Sudeep
