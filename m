Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDC312828;
	Wed, 18 Feb 2026 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435941; cv=none; b=Hg6qV1+ofQQAPMx5fiHMmmxd9jR9TlHJrSh97D+mt2XELEZfiOk5qsb/zwX3hJhNuo9CQKHwmOhqmZhMr1+YjshExDOiGwTQ8p19VO0oAI84DGvY/GQtfZhWZbfrlepL68OqFa9AbV/7G4DHc7ikQ/f9FOH/lfWQjk5w6r4Ne7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435941; c=relaxed/simple;
	bh=K594EibXGBP/sthHzmXtQyXiFHMo+WwD9N1ZlHXuwLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Md70KYG3GvVwO/hQXhoxibw5cu8SrgbGSr5DcAU+eRpnqipKvitQ9dKE6R2td71Xt1g2jU6GHClXceLSTXztrddgKOn6NxnORfYQtX3dAQ23D2VosG7vlfwM4dE8witd18GcemUFKBoVkOW3HCIpisqH82HXjpGl10lbgGyTeIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=OJnrvazN; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="OJnrvazN"
Received: from [10.211.9.33] (92-184-116-230.mobile.fr.orangecustomers.net [92.184.116.230])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 6367840244;
	Wed, 18 Feb 2026 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771435936;
	bh=K594EibXGBP/sthHzmXtQyXiFHMo+WwD9N1ZlHXuwLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OJnrvazNB7xJb3+cKAjU3Xcw6D3owAM8J3/VcT0Vh7qlr906zD3TtACHjTuW83Ovq
	 cFiJEEg+3GjTsDiWpdY49YzmdIHUQxlS+yRKrdUFvl57fwbRTF5O8wqYF6M9gH8sPx
	 etOkeaaF9ih6au7hh8FFL1G8Wv+9ZbSOEkX9rrY8=
Message-ID: <2a66decb-aa42-4fcb-9e0f-57bbb6aef2e9@aliel.fr>
Date: Wed, 18 Feb 2026 18:32:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll
 support
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
 <tanjoa.3m1sr95zhvsal@postmarketos.org>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <tanjoa.3m1sr95zhvsal@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 12:10 PM, Ferass El Hafidi wrote:
> Hi,
> 
> On Wed, 18 Feb 2026 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr>
> wrote:
>> Add SYS PLL for the clock controller of the Amlogic T7 SoC family.
> 
> Your commit description is almost the same on every patch in the series.
> Probably having a more specific description per commit would be much more
> useful, for reviewers to better understand your commit.
> 
> There are documentation pages on how to write informative commit messages
> at [1] and [2], but in summary, your description should talk about *what*
> is being done and (provided that makes sense), *why*.
> 
> You also have multiple commits with the exact same commit message
> ("dt-bindings: clk: meson: Add Amlogic T7 sys pll support"), did you
> mean to squash them all into one? (You can do so with `git rebase -i`.)
> 
> It probably also would make sense to add a cover letter, which would
> describe
> overall what you goal is with this patch series, and on a high level
> (doesn't have to be too detailled, because you'd describe these in more
> detail in the respective commit messages themselves) what each patch does.
> This once again helps people reviewing your code to understand what problem
> you're trying to solve.
> 
> [1]: https://docs.kernel.org/process/submitting-
> patches.html#explanation-body
> [2]: https://docs.kernel.org/process/submitting-patches.html#describe-
> your-changes
> 

Thanks for your help Ferass, I definitely will.

I think I have misread this part of the doc :
"The Documentation/ and include/dt-bindings/ portion of the patch should
be a separate patch."

If I am allowed to combine the header and yaml doc in the same commit, I
will do so.

Best regards,
Ronald
