Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F433515F9;
	Mon, 28 Sep 2026 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598133; cv=none; b=Kpv2oMrl6VpVna0p34X5H9kRCyAtXUhXlIB7A3glRUlyreN8EyOeAlGjzmUUj2xvdAaGlqLOjiItBhZvcxlEo0UoTr4GwhkDbblMF8HtPC4TfIXja2C6d6eywKqtTKOt04k37zV6Sn8rL8N8V12TWgLFeF4p/GWW2TUqRHARrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598133; c=relaxed/simple;
	bh=SLg1FxE9ics1/cs2ysnZ8Au0HCU8e3CEW8rQfydklFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gboVU77Uzbc0Tm8oULQtYxjeVRK3pJH2LVnw/eLO8/VhuIOfhKYd7HcKdWlei3p/irTEMcwkdJSt57WrSYEnvOChVjkhRsQ3c+KcWEgQKx6GZk8C6tC4ke5BWDAIGqwVpBRXhJzKznG/KvfOZE1pXvHObmQ5AcCioKMcF4YGsn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N56iEFcy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N56iEFcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790598130;
	bh=SLg1FxE9ics1/cs2ysnZ8Au0HCU8e3CEW8rQfydklFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N56iEFcyK3O5kuum5nmqg4Cd/C5G7EW4puEpnAR+quXdLDBZXhnBN5/5oA/fPKLk9
	 B9YhrUZ1gOL51X1saKAQIU8z8GboH0PEZ6yOrASK+FcE1TEI7PQu6811ltUwwPiTRs
	 rr45UUjsIKFmnj1pbkpfXKjzTmyA8UPkx+luhKjHcbnLWkDyWo/JtEPLuHsCIWqJIH
	 eTma1HXVFtNHWdD7nXGCZyFcFrX4MQbFsAI7VQpuTGCu05M3ZDgOY4p8vIRnag8tdf
	 1Vtwbs25pKKXvCxPeKbkfNZKMNIJt2IT4f+AsCZkZpIgHWiLPgG1XFIZ95Fxrel1yN
	 4SxCTfO6rgObw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94BC017E007D;
	Mon, 28 Sep 2026 14:22:09 +0200 (CEST)
Message-ID: <12e0953c-5181-45f2-b409-05163ab2a031@collabora.com>
Date: Mon, 28 Sep 2026 14:22:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Jerome Brunet <jbrunet@baylibre.com>, Ryan Brue <ryanbrue.dev@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
 <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 15:13, Jerome Brunet wrote:
> On lun. 14 sept. 2026 at 10:16, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 9/12/26 08:40, Ryan Brue wrote:
>>> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
>>> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
>>> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
>>> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
>>> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
>>>
>>> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
>>> FHCTL on for mainpll, mpll and msdcpll, with SSC.
>>>
>>> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
>>> this one is untested.
>>>
>>> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
>>> Assisted-by: LLM
>>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hey Angelo,
> 
> Will you collect the MTK changes yourself and send us a PR or should
> we collect the changes you've reviewed for this cycle ?
> 

Please collect the changes that I've reviewed for this cycle... I'll start
sending PRs from the next one.

Thanks!

Cheers,
Angelo
