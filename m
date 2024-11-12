Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6C8218594
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731448436; cv=none; b=erRnzMeC3e61YH04qLDmJifLI+lREGolV08gDNUBxvP7D9JhlqP6NUX/aO2xaQJlRKYz+yF9DpFkvQKg5m9ANaiFbieJ26El7Qcs3E0morj+Xkx5AUY3sZomwK+k8mF/thUhjSLlXvKlcrXcpzW5SrtDgwDbVc6ThXjUkboHiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731448436; c=relaxed/simple;
	bh=KY6UvDC+rHCkI1qvwSukESBYdVYYpDOETX7ZNHTNL0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d78sFQOv7h6dmC1yPIB9XCtiajuP3beVE3hBq0GjrNTkQZOOZL7kwxqfpf+QgFK9/XKFfYaIlY7vJ5a1Gw+ITJoFm2zFSKj340J22Ks78ZG7nvSUJxRr2TpQmnPQ/W5phLLYnG7BqYopJwVEbyyFWchZWWVBlafMvXnMfu0HNTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=DYhbbW9b; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="DYhbbW9b"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5C666894AF;
	Tue, 12 Nov 2024 22:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731448426;
	bh=vSWFFVrhqf/uEWA5kxeVnqIffQKLBFsrKHLm4H10upk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DYhbbW9bP3SG0q5TSaVFXxoc66aesxy6lKisoicD889CMEzntYV2HAJwBtkqIxBu5
	 GdrsmlQQTI8X2SlErW6lR4Ne3nfl/fsSWSgNVP2lZiXS19pEKSGTC823RD6Eqvd7SP
	 tHnDpEBr6+2H1UTQygKxVTPUUszq+DY+xpUfO++9iHX0Ltsht8CAqwIZ/gCw82unXv
	 l6E/+am0zNZrPct3vBEUtHiG1U2KjGOnlxubjt1rL0/3dcREOpiljBmBz0AKRjF8qe
	 lWfmJLdYCiFSeXHUHN3XrR9wpA/R+ulZ+d9YoViewlWeM3/8ZVKdfk6qy9V/yU/6wB
	 HxzxIK40mq8RQ==
Message-ID: <638cdca0-05ba-4b2b-8a92-3041247c2c7f@denx.de>
Date: Tue, 12 Nov 2024 21:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: "Gajjar, Parth" <parth.gajjar@amd.com>,
 "Sagar, Vishal" <vishal.sagar@amd.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 "Simek, Michal" <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
 <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
 <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/12/24 2:17 PM, Gajjar, Parth wrote:
> Hi Marek,

Hello everyone,

> We tried running glmark2-es2-wayland application with mali and lima driver and didn’t observed any hang. We will also check with kmscube application.
> 
> Attaching logs for clock summary.
> 
> Did you try with mali or lima driver?

I only use lima driver.

Can you share full boot log of this machine , including the firmware 
blob versions ? Is it maybe possible some newer blob(s) enable both PP0 
and PP1 internally to work around this clocking issue in Linux ?

-- 
Best regards,
Marek Vasut
