Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EDA3BED4D;
	Tue, 17 Mar 2026 12:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749798; cv=none; b=jWM1Gygvuo2o95T2W2PBIzh5gwfCRct89eRomIMX8n8aPlb9AwO9BAlAjcNNfJetNe3Id/rBbKSfukUY5s/TIarllWGG3ZQi720qFl8G0TJNa8zuWWfOLzdlSfAjqjXuTDVmpG0cbTcM1Cf9FgjFqxo8YHvfJH4KxDl3ocT7NxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749798; c=relaxed/simple;
	bh=XuMBNNw7U9aZTQBP8fVUmWoBfgXagrRy+rF53mhLwhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgHAhSKbnRlzLK4hwTdO64oGrdB25CP72FYlv+OlhKLj1MDZUU6ZDWOi/h5Xtjh3VQfHcIBLzP/ZkP+C43up4uBBCo0ez0dqFoD+Udq91oeSlXcdeBWmO4bmInzaM04MGIFGD+FLBaOlcw4N2jyZtxMi+Q7I3vLxOIH3WnsVtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksfCZJle; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksfCZJle"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6FBC4CEF7;
	Tue, 17 Mar 2026 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773749798;
	bh=XuMBNNw7U9aZTQBP8fVUmWoBfgXagrRy+rF53mhLwhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ksfCZJleAYM43xEqGssBjYWWw0CjUNunMHVM2j52YnFS4q2iX8R1z1Rh5ELROKbcN
	 NckCb6PaQrozN2QQeBokUG+Hifdxnd5EUcx5S8NHsHnjIGwUFzpMSMUymWEo+nq+fA
	 RkU9miQyUNm9tesmhPx3aCmDrkitPBx1bbVIwmhDGVQTKtKe5oYolsZXvvKqvleCLO
	 ikddGradpl1yYYi5lBuJkMmAdxoxU0sz7nAr7pILY2s/MJ5YfXwPpFDU0oRKEzzucJ
	 weMesRV6nqTeX3qAI26rTXfzDgyw2SOR/Pu5SmimTL8ZyshueXwlC7qjb0Y85IsH1s
	 wW0bdCLMhgZmg==
Message-ID: <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
Date: Tue, 17 Mar 2026 13:16:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-26 13:14, Abel Vesa wrote:
> On 26-03-17 08:30:24, Maxime Ripard wrote:
>> Hi,
>>
>> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
>>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
>>> discussion about how large number of systems need to boot with
>>> clk_ignore_unused. Per the discussions at the conference, the existing
>>> behavior in the clk core is broken, and there is a desire to completely
>>> remove this functionality.
>>
>> Broken how?
>>
>> clk_ignore_unused is to a point where it's seriously cargo-culted and
>> documented as a silver bullet, when in reality it's just a debug tool
>> for broken drivers, and the driver must be fixed.
>>
>> But nobody is actually fixing it.
>>
>> See
>> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
>> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
>> fedora wouldn't have to package anything, change anything, etc. But no,
>> the problem is clk_ignore_unused.
> 
> Nope. Don't ever mark clocks as critical unless system crashes without
> them.
> 
> Here is an example or why clocks cannot be marked as critical but need
> to be kept by the clk_ignore_unused: display driver probes later.
> If you mark it as critical you just made the clock stay enabled even
> when display is off.
> 
> And this is just one example.

Interesting, so maybe we need a new way flag to mark clocks as not to
be turned off when turning unused clocks off, which does not block
them getting disabled normally later ?

(I was under the mistaken impression this is what CLK_IS_CRITICAL did)

Regards,

Hans






