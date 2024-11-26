Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869001D89F7
	for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638180; cv=none; b=CxvglGH6fNL6lsWNWB/VrAie7/rc4jEVU5wEFk6IKluCT1pMQ2Q0kxeQnYMahZb/FH1aFY+SKXr7qDPb/XvVWm6f1pVqo+ocA+dHjsmVRdy2IMvEEXEw2TAmH4pR51c4Womqa1jg0tG4s8hhIzRSywDyXM1pB2WDyELE29pGNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638180; c=relaxed/simple;
	bh=B98oPCiUz5JN060lctqanmvFIhJ7BNKu2h9KB26Zs7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EohBfNmixogWqIx1vxJ7AAFKYnZnEsTJ4/8G1Vu9cXLNetMwGwqsVWgs6qHGAKkjdvTJ+z96F06+coBDxsUlgBw3bIX1Tu9fvjs/hrQFtxRJNfTqgnMRaeCX9q7jasB15bvIiP729eNzdHCzOCnROg0zFR2He5yIRm8t7J2JT1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=U8Hh5+jc; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="U8Hh5+jc"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 533C689C93;
	Tue, 26 Nov 2024 17:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1732638170;
	bh=6/ZbCdY/ecw6ecn/wcTYRT4DAvUEnDOC9uj6W7G8loo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U8Hh5+jcPOr1GekvPKC2t9a/OVjRJ/4gnxm4aVOV2H/hlJEHYBqXcvEBkvIr+Jmm+
	 dbzrrI6EOqYFx90YrZuexxAW0nHc6XUjJk33mA6nLC31p9ZTgQzr8/fG92Z0onELet
	 TOrm6KQawAfrjBOGoE//bymtsSOVx4Cb4Nvhe/BrLgwiZZ4GWY6hkNRYTzjJ5UfQDx
	 rW0It5L5guYuQYl/K2f3WO2IkN/A9frW/t+sTflFt3RaKmXjHBFT6A++IUrQtReEmr
	 wtAVjkhXK/Ibz6+Fq/NtY9VE3NgnUwiieHDBHFB5ZZPBvqs6gCAAVHJrBwn2+m+s+C
	 9oqiboW2Be2+A==
Message-ID: <8b6085b9-9b21-4043-af5e-e7fc4962236f@denx.de>
Date: Tue, 26 Nov 2024 17:18:43 +0100
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
 <638cdca0-05ba-4b2b-8a92-3041247c2c7f@denx.de>
 <PH7PR12MB69557B0065EE5D4E51EE13FF995A2@PH7PR12MB6955.namprd12.prod.outlook.com>
 <14d05680-3112-4ad6-9d4c-e892359fc9d4@denx.de>
 <SJ0PR12MB6965E6448CFB1095584B114C992F2@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <SJ0PR12MB6965E6448CFB1095584B114C992F2@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/26/24 6:25 AM, Gajjar, Parth wrote:
> Hi Marek,

Hi,

> Yes we are using https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.6_LTS. We are also checking with upstream kernel. Will update you on that.

Please do test mainline Linux (currently 6.12 or next), not some 
downstream fork. Downstream forks tests have no relevance in mainline 
Linux testing.

> Can you share please your artifacts.
> 
> The blobs I use are 2019.1
> [Parth]: You are using 2019.1 BOOT.bin and rootfs and upstream kernel Image right?

FSBL and PMUFW are built from embedded-sw 2019.1 , rootfs is currently 
debian unstable or OE scarthgap based .

> Also I don't think any changes with respect to this. Let me also double check once.
I'll wait for this.
