Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2F1CAA9B;
	Mon, 13 Jan 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770665; cv=none; b=arRTpGKU6f0yfjwxeW8G3GIq7F8CXG8P0/7ynh/+lnyDYb9Pkz+K9PemCll0lisIUmU70mU2OIA2yqgxg6MFNGd++oCOK5Pk/mTJT9l5LFQ3XMDFQqqncSU//Q7XdaX5uOBemwYfexivrZXgWgK/jxkzwjCtxO0Q63Ez8LZw4Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770665; c=relaxed/simple;
	bh=8UJKn6malhxkTLru3Gus7nVAeV8YWMTAVB0K9Oczylk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7xe2nL8hW0p65GiTc0mTL8J6vf032gX/r9QSNHIGWrM191fxpRqIxzW90agsLSDVXqLAovB5nWQpwixizVt2amoPKsuz0FUrwqMh8QS/OuU9mVpsTxyTsvGjiGh3sdIMty4EpNzIeiyiB7+5WoQERv7+g0XYOnL/a07sJd9dJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJX3a+uI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJX3a+uI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B6BC4CEE2;
	Mon, 13 Jan 2025 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736770665;
	bh=8UJKn6malhxkTLru3Gus7nVAeV8YWMTAVB0K9Oczylk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SJX3a+uI6lolTiP+swEDGvzjdD/wuwHNPOSnBCYlzEnK3cTCbujljsK2wrsxJavJn
	 RiQ5XOSYq+doadqpQ2jfAy9voXygq8PmraxmamK5I7GWKt3rfM3KW509K0TrxtLwbJ
	 GZrXxkjOcVtcj/kLyLHfiPP7su8vaVWzgxt9MMIblSI8HV7vm4UQYbCcEXcYtYuyUr
	 1QYFkEfmIKzKIf8Fw4gEoGYnn+NB7BeMm71X7WI6YRsWTGULkQLgPCxpjspmpYvOP6
	 SKfrAKw9Qk2Ufzho08tCXWofBVNXL2A2OPSNtsDLpypGR5eCNTPze9++UScUNnioMw
	 Fcprr5TpyrzZg==
Message-ID: <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org>
Date: Mon, 13 Jan 2025 13:17:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 yangshiji66@outlook.com, linux-kernel@vger.kernel.org
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org>
 <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/01/2025 12:32, Sergio Paracuellos wrote:
> Hi Krzysztof,
> 
> On Mon, Jan 13, 2025 at 12:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 13/01/2025 09:28, Sergio Paracuellos wrote:
>>> Add clock missing definitions for RT2880, RT305X, RT3352, RT3383, RT5350,
>>> MT-7620 and MT-76X8 Ralink SoCs.
>>>
>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>
>> 1. Please use get_maintainers.
> 
> I did but from my tree which is tag: v6.12.5, linux-stable/linux-6.12.y. Sorry.

That's separate problem, but not one I was thinking about. Even on 6.12
stable you would get dt list, which is missing here.

This means no testing, although does not matter here, and it does not
appear in Patchwork which means does not reach us, except my filter for
nagging.

> 
>> 2. What is the point of this? We do not add constants when there are no
>> users. Commit msg explains here nothing.
> 
> All of the old ralink SoCs' dts files which are in the tree are not
> properly updated. I expect to have them updated somewhere in time
> merging real base stuff from openwrt dts [0] files. Not having this
> header with definitions makes very hard to update dts and then
> checking the driver code becomes a need to see the indexes for the
> clocks to properly setup a consumer node. Because of this, this file
> is added here.

Still there is no point without the users. I do not see any reason why
this cannot be combined with fixing driver to use the header. Not
combining is an indication this is not a binding in the first place.

In any case there should be explanation in commit msg about such choice.

> 
>>
>>> ---
>>>  include/dt-bindings/clock/mtmips-clk.h | 130 +++++++++++++++++++++++++
>>
>> Filename matching compatible.
> 
> There are multiple compatibles regarding this, since the driver covers

Driver almost does not matter.

> a lot of SoCs. So I preferred to put them all in a single header file.
> See [1]. Should I add a different file for any single compatible
> instead?

Well, are all in the same bindings file? If so, can stay but then:
filename matching binding, because binding has proper naming scheme.

Best regards,
Krzysztof
