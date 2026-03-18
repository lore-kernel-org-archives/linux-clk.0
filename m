Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095623E350;
	Wed, 18 Mar 2026 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847770; cv=none; b=n9qaReanaexAq7JBwk5eBA+IoN6RQcXlLu+MIGVWE23V2UKdaPH4NlVZsTg/DXzkA+9SeuTcgG82Pau6NbiQ45GFr6FJLtKuvvp5KaG+BMROt9s5YvyB32wGvuK9N2RbbCJ3bbvxhS593JRtB1HMBOzAq2i2EyFGH5G5T9jeH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847770; c=relaxed/simple;
	bh=2K+rVR37l7dSsF1Tew9s8OkMusF0TWNUD4t6yo95/r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgwTlqUyPoUDBL49/ZHZKiNqn5Sbge+IFADxRinQlWj1Kd+WdBzxKdOVs/REb72YUrJFVGVa+yfNKPAqApiOc1UUG0NqecBGzaKq67ZS5MSE3cmBd7dm/J9Ixb8MV75DHA9kYdkrSKAwftkEsp6rZmLs6Nr5I/99z0gXs/9Ugak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+D3ha70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+D3ha70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A23C19421;
	Wed, 18 Mar 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773847770;
	bh=2K+rVR37l7dSsF1Tew9s8OkMusF0TWNUD4t6yo95/r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+D3ha70AquDub0ZgyBK9pfNZe+hZqGKzvNNk+1TEhMKNIeVjI7gH3GcYdmz3fYmS
	 jH0EzNnY0zzPuA1+dbBfRuUSCvHtuI/5VL5exynhru/0YlGsLjDXANqX7oIySVMAj4
	 f2MploVtaAoWjw3qD3+TcollqAkNi9dC2kFn7RDv3T6mCI+xBjkx2MpiLCWR1xcixq
	 Wds3UrLsxHRz/jmBlgH8hsQSIuR/BLwfE2UxayTg0eaOK0ymmX6hwaaMZdm1YRnPTc
	 BwxXJ8ZhxWNNWac34awQZto8gBjXXMPMDlY67BWmEU+aixx53Kkpi00vZAZfe982iJ
	 2LgDZ76i5KQDg==
Date: Wed, 18 Mar 2026 15:29:25 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 05/13] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <20260318-astonishing-magic-skunk-5f45fe@sudeepholla>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-6-cristian.marussi@arm.com>

On Tue, Mar 10, 2026 at 06:40:22PM +0000, Cristian Marussi wrote:
> Use the new min_rate and max_rate unified properties that provide the
> proper values without having to consider the clock type.
> 

Hi Stephen/Mike,

If you are satisfied with the clk-scmi changes, I can take this series via the
Arm SoC tree. Please provide your Ack for patches 1, 3, and 5/13 if you are
happy with the changes and with me taking them.

-- 
Regards,
Sudeep
