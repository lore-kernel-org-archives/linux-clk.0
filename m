Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305083FFD;
	Wed, 25 Mar 2026 05:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774415572; cv=none; b=sSfQLUrm4IKLOBxhl8fBieuru4uGZ2Cdq/6VGzm3grWI4Pz359ECEYUdAv7HRwsx+NuNlP5sTuHiUFYd4xzQoNixbVLDUMW29n7LxPu6dzBO4v9TZOSzhhUtD6qaXshvqJ7GcCGVfTa8gk25pBV80mtI7yKfbKag1gU5xv0G9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774415572; c=relaxed/simple;
	bh=B6lrKNtvVsOyI6KKnTn4CakjCJNKIFBVJdnEHoZ5K1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TED7ecKVxmq1TTlX87S4wlaajUJQwOgINxii8cpThsEQ+A674WF6yR3gJGR/SMD2wzow+b5o+PMCjOUDn9i0BevCQ1dlSnGWpO0ar7Isz/oYPBzCaC1VMDF2qJEqYdXflCMf/E3QN75ySDwFBhZhzyhvomko1LmUj8/TyBi1rpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 25 Mar 2026 14:11:40 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id A51672091483;
	Wed, 25 Mar 2026 14:11:40 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Wed, 25 Mar 2026 14:11:40 +0900
Received: from [10.212.247.82] (unknown [10.212.247.82])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id EEF1410A0BE;
	Wed, 25 Mar 2026 14:11:39 +0900 (JST)
Message-ID: <09fc1857-e554-48ec-8862-54f0650b1c58@socionext.com>
Date: Wed, 25 Mar 2026 14:11:43 +0900
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
To: Stephen Boyd <sboyd@kernel.org>, Anas Iqbal <mohd.abd.6602@gmail.com>,
 linux-clk@vger.kernel.org, mturquette@baylibre.com
Cc: mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
 <177431305509.5403.15386021337517970667@lazor>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <177431305509.5403.15386021337517970667@lazor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2026/03/24 9:44, Stephen Boyd wrote:
> Quoting Anas Iqbal (2026-03-18 04:02:51)
>> The uniphier_clk_mux_get_parent() function returns a u8, but
>> propagates negative error codes such as -EINVAL and regmap_read()
>> failures. These values are implicitly converted to large unsigned
>> integers, resulting in invalid parent indices.
>>
>> The clk_ops.get_parent() callback is expected to return a valid
>> parent index and does not support error codes. Fix this by returning
>> 0 as a safe fallback in error cases.
> 
> A large number will exceed the number of parents possible for the clk
> and turn into a failure to find the parent in the parent map. There's
> nothing to do here besides implement clk_ops::get_parent_hw()[1] and fix
> all the drivers.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-parent-rewrite

Certainly, the return value of .get_parent() is now u8, which doesn't
correctly detect an error in the function.

Some other implementations prevent .get_parent() from detecting regmap_read()
errors, but if it does, the read value is undefined.
If access to the parent fails, the only option is to propagate the error as
Stephen suggested, however, that affects all drivers, not just this one.

Thank you,

---
Best Regards
Kunihiko Hayashi
