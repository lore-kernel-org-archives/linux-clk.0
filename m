Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D91C6B4
	for <linux-clk@vger.kernel.org>; Mon, 26 May 2025 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748226833; cv=none; b=uSp8MwFzLG2cCyjQ5k/RkhAKTDIuC7OY6W4P5EekiZWO66H1Mka8F+24xpAsZrYqd3qBy/icBTOCCjp9MC6SCw5lqRnyKflGLjDAYXzn1ZhvFt3+AiUEVTjEu2gx9HgT2h4AaqB1mNR3ZN7+dJJ/GKdpcyxAWLAseZxrYtV+0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748226833; c=relaxed/simple;
	bh=r4VTOKE7niw9o8hVYOZpbcu9LTu6vXx4wDNl8oA9EkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lE6FqNFOIx2CQPeDLqHhaoXW211SaK8pY7ymlmcYQnf6V6e964vfvQO8uUIVkpr/aXCdYXJUzpwRwKhpez8yTeAxH2iqQ0Qbn9l36OT8BXynZy/D0rM8dRDYrqI5rwSmh9qR8C7aeFuPGgw3fqJ8U6I0tIHDT0CpKkPWXRA85Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NlPnUY/7; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NlPnUY/7"
Message-ID: <ef9b8be5-075d-4611-8587-b1e63eb3aa3d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748226818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk4aU1yhp9JXNIWuU63CnMtHHLuSiMgRMS/o0R8RjEY=;
	b=NlPnUY/7PSyYa1cMtwbYdhICGQyhU8Jr3yl7oFhIdU/E64LdsnLL5vT6t8tonc2qcX9WrH
	bN3Uecs3hbnvST39mK2U388lWedGpRgDqhJBNlAoiNpnrFSOPA+ZRbp3dKNjU68UyQoihn
	gXySKBLYpVpNPLzLtOzeUfTH1AaX1W4=
Date: Mon, 26 May 2025 10:33:30 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] dt-bindings: clock: Document Loongson 2K0300 clock
 controller
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250523104552.32742-1-ziyao@disroot.org>
 <20250523104552.32742-2-ziyao@disroot.org>
 <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/23/25 8:30 PM, Binbin Zhou 写道:
> On Fri, May 23, 2025 at 6:46 PM Yao Zi <ziyao@disroot.org> wrote:
>>
>> Document the clock controller shipped in Loongson 2K0300 SoC, which
>> generates various clock signals for SoC peripherals.
>>
>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>> ---
>>   .../bindings/clock/loongson,ls2k0300-clk.yaml | 52 ++++++++++++++++++
>>   .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
> 
> I don't think a new binding file for 2K0300 is needed. Adding
> compatible entries to loongson,ls2k-clk.yaml would be more appropriate
> as they are almost all similar.
> 
Same here!

Thanks,
Yanteng
