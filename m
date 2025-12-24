Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B955429DB86;
	Wed, 24 Dec 2025 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766599497; cv=none; b=oLiBllvzR3/voeA4WUkbBYAmp73HNACnP0RcfHRrO8f49pfvGjlxZwYFZVCt3sjSwicWz3xd1gkzlqHJ8hLvg98DwtQLuala5UnLVzLAPtVrD+zeE6Gd06Yzn6vae8IespcN2oaC1dVIbikU0zsrN2N80jEZRfMEUUVI5kqwIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766599497; c=relaxed/simple;
	bh=Ln6dfL5GQbqphMo1a0xs9KOB9uzCFenNgrlRDSGMxhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDYdMHlkgcwLZXcqO4a2LNr40IxjeppImWglHbXuvjF0zLROMacgtWbpKOLGVOMISLM05P8d0AVaJiFDKbozohy/CEoxuIZi4oUw3O9vARKdVNAQubI+g1SJcJ3xLjrUW6v0HbopZJ5F9CtPEgZv8khBdGmRpY3p/k7p5sYH36o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8916339;
	Wed, 24 Dec 2025 10:04:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D5333F5A1;
	Wed, 24 Dec 2025 10:04:52 -0800 (PST)
Date: Wed, 24 Dec 2025 18:04:50 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: scpi: Simplify with scoped for each OF child
 loop
Message-ID: <aUwrQiALSG8MRj2L@bogus>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 12:22:41PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
