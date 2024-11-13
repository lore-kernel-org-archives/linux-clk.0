Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67E15AAC1
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731529682; cv=none; b=FrW2SGy9cFIzNwukPXy67MxS2SAgjT2JJKEEypPhethldzSontrkQxrwO/xrv5jsJm6rHdSJ95eNbIRuKSz16HJ5jMH1AJCntBEZ2TM9zoG59B0U16SRa8g/4eJSJvJy6fTCjnmf1xqNIX9Uz6ZaRKtI1eTJgYdQaWb/fCIgOpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731529682; c=relaxed/simple;
	bh=VRCGbzuicN+hqoucGC7PxFm9NfcPyDsHgm8/FpngGqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5F9fmSGnU39lzI909OT5j2fAuU90Q/DxdPNYVrSzjs2NDWq6QIcRmhHHUQqX2yHHxZb6rjz+/eFe5/Q95GUfmNZu+GGNhyAh1BfDKWOT2W3qB8bT8AGWbEZByE5bCk9hJKW+9ktovfprL7gFYsQsARgyX6yC8UAYsBmcvQaNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ydVeEGP6; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ydVeEGP6"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 53CA788FFC;
	Wed, 13 Nov 2024 21:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731529678;
	bh=lWdraMTVeNIM4NSlaCzFrild4p5shHOr4URPUgblrBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ydVeEGP6ZxJfQzdHvT7d6DrPLkYX+Vzax5Cvb1wmTPw+P7jCNGkr3Ibr4dYtXrQi9
	 gce+/El8k/r3LAuvjxwypqNxPxFPy73+MJXNvST7S78jCN1EqLE8vCBg+SXow4lqln
	 RbmPLzChD5dya9jGH3NKcT6mIHqG8jl3LAW+KV8ygyBtQRTcdA1l9LPkdoI7MjBtZo
	 /pSP8c1GhvRtTA83TVwnOS99bNxLUjaHSytLUsLaQij32YEjAmdevwkhHY/IbKq6Fb
	 RVQTaBD+UQBrW2QGbwuAxs9hv5eDFTLcy8GcuolrTunvnCOZh/+GAGHrEMDXJkA5QQ
	 W1deQGy2iu25w==
Message-ID: <14d05680-3112-4ad6-9d4c-e892359fc9d4@denx.de>
Date: Wed, 13 Nov 2024 20:55:47 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <PH7PR12MB69557B0065EE5D4E51EE13FF995A2@PH7PR12MB6955.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/13/24 2:32 PM, Gajjar, Parth wrote:
> Hi Marek,

Hi,

> We tried running kmscube application with lima driver and it is working fine.
> Attaching application logs and boot logs.
> 
> We are using our 6.6 kernel.
> Meanwhile we will also check with upstream kernel.

Is this the heavily patched kernel version from
https://github.com/Xilinx/linux-xlnx branch xlnx/xlnx_rebase_v6.6_LTS
with
  865 files changed, 216895 insertions(+), 8276 deletions(-)
or an actual stock 6.6.40 ?

> Is it maybe possible some newer blob(s) enable both PP0 and PP1 internally to work around this clocking issue in Linux ?

The blobs I use are 2019.1 , so what about this question ^ ?
