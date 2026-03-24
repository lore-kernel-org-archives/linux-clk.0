Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0539768D;
	Tue, 24 Mar 2026 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366863; cv=none; b=KBXG0cKT9K09Pr7Wuj7cJH+Fk5Yv5znWoDOJFLi9LD1HFbUYneyOoHHSkjkSxR0XtxvC2MB8rOjrFxeBKj3c/OpvQKsVg+fwSTcOua172+8KE6TaC6TkEW5tp1Ft6Ilwi02eSh1mDJELchipYfPkVLj2lgEMSBithhKgHYC4+wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366863; c=relaxed/simple;
	bh=y2qdM0vVbdDWPFJE2VO5KPJHINtDKQtnoBNOpJBCJSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uStGyx0hlaYtt1ptszuKkYWSRaLDn5UxZno4OZ1Uv2UPojDa9n13rO16kzhloVKU9pL8CxT2gOpmzhT8aPTFIRe2u3O9JiPpGaF/NEBSn6Buo2uAYSIs0ZcH4sU/ZayNEyaPPE7TZc9aXiM83a3jc/9DCf8AvU2b2bbe6Nf1wMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zGstq0dv; arc=none smtp.client-ip=43.163.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zGstq0dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774366849; bh=X+/J9odCGJ6RNheltOTiGN9mJ2WtSKY4rQgcSUR3a/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=zGstq0dv9D1H5vjMOi9bPqEFLXIO/sNbQrTJbNXr5Ww1oGhUTNHiAQHEBautEOlgG
	 HzDKQE+w02gUmjY5lentTMaZJ6Pcg/4c4sr27NmvElSC6HyOKqog7zK++zYtBu86To
	 oqSiGjpaJnMCcQPp4Tp46MMX3v3gdrcJa6VL34vI=
Received: from [198.18.0.1] ([122.195.139.226])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A2DA9C78; Tue, 24 Mar 2026 23:40:45 +0800
X-QQ-mid: xmsmtpt1774366845t9i05wxn6
Message-ID: <tencent_8862A8A2CC025DA4A7364DE3BC36A685000A@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uVABu7X+9igjh8n4lZg04lk5yQWA6pt/ngkUF29rmNJE0kS0w6W
	 Z1vQFQqQdcrkhGbujJ/bPSmT1PpGA6pt9ec4KQv67bzfyLlxHIQJlO/5Q/BfrOCWHEBIL8yGHtr6
	 SiZa+5GH1McKehNHhY6maJKUc8oiSpKrllTgNX2qmcXpwSib9G+4PPTVIc38KLOw6KULqsA4G3sN
	 bcB00DkBfvJ01aou+XGeP89Diog7LgfkU9hCllGEj18CHLc1cDe631npNfmcSFbprJ6K6TksM5i9
	 YQQ0Iog2cDfMHwCeZ5SIR6+w3h7tVKNUV9Pr7vIa9Oh++8LTy2bp0qups7pByHXq6D+2SW3QI8kO
	 BXnv0B5O64+Da7I8yOY2UQo8CXL50GincowXLk09dSwuBssCNZRFAn5OSCiZDcB/6QaXdym2Klnh
	 FL7trPSx+x2R7nu+D0QITdFBoATdNKR2DhI/DLacrYHrLp4Uwo+JLTmTKHAW1jxvvwOaEQLQtyco
	 a/XkIIXqa2WYq0s2KZOTgXzcfq4ynrx4PzirRboNioAarav9k7Bb97Uep7q84W2zLZ3svFmjMWlp
	 30e47a2D4D+nv/j8X/S1in8aaT4Ncg7cVgWksCP+AGqEyZhXNNyTCeNSR/wP1M9dl8LopEe7EG5S
	 lLYORACjRZceF2c0G4cE0Rl6E5st5sjTWJnStPHlbbfQENnU0DVRyFQ0B7AdCWgsfgGTgsT9SSjt
	 NQsVYpsBfxOebe5Q7GmYO9PSZgSBHrQdDhZR53lTa0Ba7Lxr/84clHkXvJVUbiNWUGvKgE8Q9Gn3
	 MQJjVSYyE32tfLwMJMyzNoQC+8sAcBXlLUs+K7jila/l52gErcPryfFtyEa4bCLC0OQxU/kUdufb
	 D2/Q0UiY+SOnl+YtiTdpwwh6o2x4WfoZER+uvXi209R2t+dbzPeUQwZs8gVGtUrQXPdzgqckOOEg
	 TEjOt73gsaaxIFIXA53iQUAA9x4I+if5TYFhuTcHfKrybJYDR7NPi7cLNO0LS9zZhhwXk2MUzQaq
	 lP8TDxZg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-OQ-MSGID: <0f918668-e054-4c9f-9710-d994c28b1007@qq.com>
Date: Tue, 24 Mar 2026 23:40:45 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] loongson2 clk: introduce ls2k1000 specific
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, robh <robh@kernel.org>,
 krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
 chenhuacai <chenhuacai@kernel.org>, zhuyinbo <zhuyinbo@loongson.cn>,
 mturquette <mturquette@baylibre.com>, sboyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 loongarch <loongarch@lists.linux.dev>, kernel <kernel@xen0n.name>,
 devicetree <devicetree@vger.kernel.org>
References: <tencent_AC8D0BB5D4C7698A57A6B42D4038559E5907@qq.com>
 <tencent_78A85ECCF65F70A7A24D63BF52A6BD03320A@qq.com>
 <1d8def7c-bc9d-46c0-8584-67848bf12ef4@kernel.org>
Content-Language: en-US
From: wjjsn <wjjsn@qq.com>
In-Reply-To: <1d8def7c-bc9d-46c0-8584-67848bf12ef4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 04:30, Krzysztof Kozlowski wrote:
> On 22/03/2026 16:27, wjjsn@qq.com wrote:
>> Please ignore this series. I mistakenly labeled it as v2 (again). I have just sent out v3 which supersedes this one. Sorry for the noise.
>>
>>
> 
> Can you slow down and read the feedback you received?
> 
> Best regards,
> Krzysztof

I just saw the mail now.
I'm really, really sorry.

I don't know why all the emails you sent me
were classified as spam.
Next, I will carefully review the feedback
you provided and make thorough revisions.

I'm really, really sorry

Best Regards,
wjjsn

