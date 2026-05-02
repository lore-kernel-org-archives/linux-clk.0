Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790032A3E1;
	Sat,  2 May 2026 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777721524; cv=none; b=flTqpYrRlqr6VnwLfQYXOh3pZH8md4e54m6pwQmqRLXglDfrO5LFPPnnsU8b9wgNiyaVh3UPwkzjsMWfaTwE8/95ctqYDyvqBl8561BawEDW5fG2kUVcjm6uD6EeJJFfUQsBUMN8xcJwa5/BW0x4q3KCmu1Qcfkn7BHcDDIWUsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777721524; c=relaxed/simple;
	bh=9D6m49EpCS2agbuFMF6TMaS57eerDfloBvYKv2rxZNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuYYtsAbhNVnPke8unFRc3SVoMx/FZ6hpl86lT4ElCXGChr/YAP5A63Zl45Whqdj2+QHSYVldTD8Zl1jWlB/rV3YgRjfg5gx+AGwYcgq5WqSgQrE2KaQFcTJ20Zz7QKCpTF7wwbAYg9pf47Yj5W7lL7OOl+/6O7wVy1AEf+p70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDLo3XuN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDLo3XuN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03E3C19425;
	Sat,  2 May 2026 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777721523;
	bh=9D6m49EpCS2agbuFMF6TMaS57eerDfloBvYKv2rxZNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDLo3XuNIlDMqMtt7vkRuIvt0FEhRxZ8JHg4wZ+qEg3QbyeiuFibOhXsuvm1sS3Y+
	 rn7AKd+EcHl8033XvY5fQ7/BouDkCLv9ZIMZ4NgGVH99PxThqvyqBMiMogPtwk7gSV
	 9rmiQ7qxE9SYdpXWOvmI5UCOZFlS9nd8mPPIR54gHAhFYEHTuN7mDRgGVky9CTup8Y
	 ys0am7iqd8/Wex442QdGtpgh11LBJuMMn+ponirVZCWa3HqI3oomEeEG/+Vdbno/dH
	 RACWiYxCedxmlu1Zxewp/6dTdyV/ADiXVPsxDNNbCM+Jq3fsDM8SOra06Is3FiFNZZ
	 XhC17t05Ezypw==
Date: Sat, 2 May 2026 11:32:01 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Message-ID: <20260502113201-GKB3266396@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
 <20260430-plug-bolt-8ff9137717fa@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-plug-bolt-8ff9137717fa@spud>

On 19:55 Thu 30 Apr     , Conor Dooley wrote:
> On Thu, Apr 30, 2026 at 10:30:26AM +0000, Yixun Lan wrote:
> > Add clock IDs of PCIe DBI (Data Bus Interface) clock.
> > 
> > Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")
> 
> Why is this a fix? As-is, this looks like you're abusing the Fixes tag
> so that this gets backported alongside things that are a fix that depend
> on it.
Ok, will drop the Fixes tag, since the PCIe isn't actually activated yet

-- 
Yixun Lan (dlan)
