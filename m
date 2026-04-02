Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304A1850A4
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099596; cv=none; b=umJ2L2b8vRBAHlX+yoyAs9pLS3r80aAH3t2xcghpizYuxP9YXmJKuSiYjCBEkhTK/ik+LyzSb1wtdS6hXlS4onaFlBc3E+44XzR5th1jt6tiHOgSB30qAdrxkDugWGLlF3tknQ8MqP3E5tarezbsbTg32IspNzW+CvvBrgWY0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099596; c=relaxed/simple;
	bh=qRqErW3371HFJSW9X/ggRuPG1UXb0WJ9Li8I6Mn4B+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AH0RXEwVWRL8twj8o76/vviCD04ggYaSxwQIWDBFxjH76ZUvxF5Nu2SBByiF3AK+9iFzk7fDUZfmpFsrgHZV0VeQWDnjnT/HlCszCtgod/WkhCwqNcKBsc/8/efDFHsB39e1nH5SO0epS9q7/xY2cjuWxS1xphRcRNLnVTr7pZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=n2Z3F2YO; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="n2Z3F2YO"
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id 82fRwkBWp4Rkp88UbwdwlZ; Thu, 02 Apr 2026 03:13:14 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 88UawSNZMHtqh88Ubw6gLg; Thu, 02 Apr 2026 03:13:13 +0000
X-Authority-Analysis: v=2.4 cv=AtXu3P9P c=1 sm=1 tr=0 ts=69cddec9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=7T7KSl7uo7wA:10
 a=1UXpIvhHyTCAxuUnJfYA:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RbxD/uaBTE/UxOFohHNJ+4K/78k2KwubLxJhAG9BMh0=; b=n2Z3F2YOklIG9l1rwGNsUWn7K2
	MSeX/ux0P2G/4T+1kamEq7dsAX9qZaGSOTQbUzphSOdpciTaP8N3uk0AmEEW0/3nzMIlNUV7DTnqa
	ZGZQCrHVT2Rx1EmkOprzadhVPqcADr3+hCXsHNy3mwP6PZfKWZibYpwznvoIVr6q4306nElpo94+l
	/iRWPkgyb6w9K/uOAL4u6ovAJJoUn85HC0L9EQAdBiuJVEK16Wr4sYCHgaPB41/DuTofZZIdShNEZ
	RIrtTpAfJcK6rsLfvtfPwXkgSMJfc9t0I6U18x3xY9aSMICa8FgQKSaGm/bLQwKynxzf0hhK5Du7T
	G4BJKhZQ==;
Received: from [177.238.16.13] (port=51198 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1w88UZ-000000003t7-2IzI;
	Wed, 01 Apr 2026 22:13:12 -0500
Message-ID: <f6945a16-d726-4666-9bc8-1067a7422a81@embeddedor.com>
Date: Wed, 1 Apr 2026 21:11:52 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: samsung: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260402030432.101066-1-rosenp@gmail.com>
 <20260402030432.101066-2-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260402030432.101066-2-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1w88UZ-000000003t7-2IzI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.13]:51198
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEyqQjmoKPSnDkT3SNs/SDDXJC879mTO1hnc+Sbnj8VjgACxmnULmLoNscDGCWhlc2bHzSNVsh00F86l0J7XLzl8+/Vo4Mzg0pvQDH7PiOmvCCNhON01
 yMFpS64SNT96VGHxoXezIU45etYOYtwm7ezlXU8Rn7U2d6OW9oe1XWBSeW3bwrGJ3CoPZIwsJ7IsvL27IDW3LZ+RYsB1QHCBdfQ=



On 4/1/26 21:04, Rosen Penev wrote:
> Simplify allocation by using kzalloc_flex with a flexible array member
> to combine allocations.
> 
> Add __counted_by for extra runtime analysis. Move the counting variable

> assignment right after allocation as required ny __counted_by.

As commented in another thread, this is not true.

(The same applies to changelog text in patch 3/3)

-Gustavo
