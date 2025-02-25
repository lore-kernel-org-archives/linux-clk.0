Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2F1A9B46
	for <linux-clk@vger.kernel.org>; Tue, 25 Feb 2025 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518092; cv=none; b=TKtQBNRdV+FWMAse0QXDMwstg2BnXyJ4eGrFQtKXclc29/ct6YIG8T0xmYLK1vGQ0brpO2OEldcoNbr1Qy4DI84Nr3yu+Pl7McO9cJLxNHKoo/NruC69t56RNWBVJgKKuyWhXetqZxT/HJQabmK0ZO2BDId/0YkeGoRZh8SgMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518092; c=relaxed/simple;
	bh=z/htcAKy8BejW6BaJDus/dUUa71EVLTzM8XjVA5Dt6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtjbpUCNIHOwhTIVEOwlPsGhm/b1ypX8fHJ3VGlcG38KTo0tvozme99xxvubLnHOXS3lmYMHqcgo3ZdjBEo7Bhmw1Jz/iaYMnfrhiTFPk3VgJbFaVkFXlWR6bfr14p6FfIDUCJKbXuOk/t4UtIuK37eRaRIc5gmePxk/Lc4Co4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EIlwq+CF; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EIlwq+CF"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d1a428471fso46016615ab.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Feb 2025 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740518089; x=1741122889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xh2s6sLjIXbWIAOmjMi7Yyx9NKVsC0mal+LFgBmzJUY=;
        b=EIlwq+CFdz4mG+Xrh0uEGEZ54MGQdEFFbeVFENLfhrkpm6ZwY/nlaE0VtqAioJlvUa
         21/pO1bYfmgkwAnyyEDn9bGhNLVf2qrdL0IxZnfIFNQffzXiml1XymG37H2RP3j2Z5bE
         7xx8+sQcYCBP6C7YT/p/LvaUJMFU6KPeQu2JoGYNWZAoGOnCUFewtzlGUYDE6C5//tyo
         ToImm8uFeOmwsdOJwGvD4J17L7g69K1ROU3mbNqJiFhoeFZHUun9bX5mRkGOPT5pq80h
         UzAeZ2Uss1XrjNKymjEPRSQdxIp6AQ2cHgBCAJpuVR/e/uSU7uina2lb4AUff5RnWvNF
         owBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518089; x=1741122889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh2s6sLjIXbWIAOmjMi7Yyx9NKVsC0mal+LFgBmzJUY=;
        b=ggez63t0NfLKDfEdhKXp6cpN6xavFb8WYNYiAZTJxO3YkReah5jqZFMdZVI+F1sM8M
         EKma7/7Etj+ZbIr4zMpIaJneTqWLDxjGfYYsbcT5XukcutkBirXw+BO+mFP5AzXUPrWJ
         3CjUXWr7wUfJF4uvK49OhIoB4nVpnW84lIFuMQAweHx6bqoBlkq8V3y4v3yVMglNFkqi
         PJ4NXfcvvjjtVwYBv8PtdM/ExZKyAo1NRyYH3fnUAZJLrb9HhHgsiRqzPzIJpL48Q/tQ
         gUYSuBBDwmyoMN+Njhu4VU0gj3hKGztzw2F/INJZYlDzTXM7lNLZK5UkbrhEJ2wlxQ6f
         jqfA==
X-Forwarded-Encrypted: i=1; AJvYcCU3LaEHoYwGbRbdZXZbovFf6MBDHanhk6VfJxQBHkSu/0sKNhWSrx8X7ybfTlkyQIt/qHfWYY7T03o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcUOUHvyVzNlcEeE2rSdMKfFacS5aKEkdWZu9uHOH6Cuc7uuv
	bE9pRy0jjmJmCuUIebSDSdOCMw7+s1S1yabh9MXx9ZrE2/loaOOqvvf5c2yw7mc=
X-Gm-Gg: ASbGncu8rhCrXSEZi6GiQ9vmfktOsIvLdnpd9cCk9+mH9u4KFknr57zd95mciGhXQlF
	8Yo5jQcXrWbRK2vJg/gE4euYAUFGLQKz3/K3+MKfTPnU91/H3QzpDHaGd/GIJ5OFado8IrFApcB
	lO+bxTFTR9E6r7LzEIDBQGU6FbA/qJN6M2zPlPMGWN3TzLoWYgM+FMt2xU4wTHchRASprKJcppE
	EgenUDCTzKhckbbVqKJsbrdYMrnFNaXFDZ5h+iaqA9xyQGAeuUdhWna/xvRhEfvc2+zCEgeqkcG
	iv7mBWlheFfJ4L+CZ4pfYfbCX04Y1z1EHgCqr3cwfK9Ja1fIFYGLqPrCFvF5inZ6YA==
X-Google-Smtp-Source: AGHT+IFYiGdbqXZivMiTUNph/SuErSNuziRQ4+AzafOTADCcFATdduAQ55CPRDAy/XVPlsW8jn+L5Q==
X-Received: by 2002:a92:ca0f:0:b0:3d0:1fc4:edf0 with SMTP id e9e14a558f8ab-3d3048802e7mr47557345ab.15.1740518089508;
        Tue, 25 Feb 2025 13:14:49 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d361ca210bsm4894255ab.55.2025.02.25.13.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:14:48 -0800 (PST)
Message-ID: <34666c12-d10d-49a1-8316-bdd18cf1319b@riscstar.com>
Date: Tue, 25 Feb 2025 15:14:47 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>, Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup> <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup> <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
 <Z7BTVu10EKHMqOnJ@ketchup>
 <7c697e9a-d6d9-4672-9738-93ce3a71beb6@riscstar.com>
 <4f7bf109-bf18-42be-971c-5d5edd9595b5@kernel.org> <Z7mrdrACFp3m-7sy@ketchup>
 <6ea8ac17-42c8-46fa-b970-77ba89de66c4@kernel.org> <Z7xHRAFE4-QEA6PO@ketchup>
 <976a2029-c0c0-4093-a3cd-71e1524db032@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <976a2029-c0c0-4093-a3cd-71e1524db032@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/25 2:12 AM, Krzysztof Kozlowski wrote:
>>> They were brought here to discuss for some reason. Long discussions,
>>> long emails, unrelated topics like hardware or different devices - all
>>> this is not making it easier for me to understand.
>>>
>>> Best regards,
>>> Krzysztof
>> By the way, I made a summary on the hardware covered by this series in
>> one of my earlier reply[1]. Could you please comment further on my
>> proposal[2] according it, or pointing out anything that's unclear or
>> missing? It will be helpful for things to improve.
> Thanks, it looks good.

Sorry about my earlier message; I hadn't reviewed the discussion
carefully enough, and what I said didn't help.  It seems like
Haylen is on the right track now, and I'll wait for the next
version of the series to comment again.

					-Alex
