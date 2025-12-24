Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE20929DB86;
	Wed, 24 Dec 2025 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766599529; cv=none; b=CpazwjrpqeLt9F6BPrzjurIJ79m2nRwTE99+5ECIcpY+INa5V5QPxw0g5gchG0NFlT0SNd5PR0SaFBl+9zsDDNB7TKhZlKLOa4AphCvaHy2FkzPTDSsZJDxNikvE2JpO7q9rmh6NwbZFqIrbDEdwLaj0e3Y054+A9jCEo3v2GlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766599529; c=relaxed/simple;
	bh=yecMTYqZTYL1eK5AK9kI5FP6zyMvbFzl84qFEV/e1Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW83icRy178fepH03hCQvMejjIHmAZ9ctT9uHUYz81V9VhErjQk4u1GNaGsC8bFcuI5Mh037+Iq6MNh8JvGXDE/X2a6xrF50MMB4Op04xFBdbDK0JukD2zyGINYJJlBHctY57IEuS6WEc5wh6fRU8Jqn5YcjJM7IV70xnMrRD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9D8339;
	Wed, 24 Dec 2025 10:05:19 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88D353F5A1;
	Wed, 24 Dec 2025 10:05:25 -0800 (PST)
Date: Wed, 24 Dec 2025 18:05:23 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each
 OF child loop
Message-ID: <aUwrYwGFhRFBAizq@bogus>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 12:22:42PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
