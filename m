Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7F3BE627
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537044; cv=none; b=eG9KPnKdvHSb0wUsiFAb93n7HBb/72uct0KvLX/m5J3LM+InVc+ULVD8TPh58r9lJFs/vXObMTCpDDnxo0bfS44tA8SrrXQIYOZIjqD+LGhJmnJGuoY/vTTe0LjbINf1VqbbRy30To/+s4fS1XU6yMLHgWvfWZSe856dEmIQsc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537044; c=relaxed/simple;
	bh=hSrFY6yJOAn0mmdan1yEptjvNe8y2O/A+HPVrFv+sLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L2LjKj0sLhqoRNJsE/S6aof7WnkTGkFgjBkE37O+KvtiNjFgGnmYmHmHHt3aoQNR65NPsE913U2nugnKAjQDd5Nosu+frXEG/AomCpg/p2kMMxoCq19BR0jdgP6LDmg5/FOGoEfpZcYLIbc8d2jSkgEj5Hw+ymvKvimf61QvHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Jj8R3cr8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Jj8R3cr8"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso4790521f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791537040; x=1792141840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/JIy/pMq5OkQ+wPHl+YKwojqjh6/wHrpuO6FCK/Wi4=;
        b=Jj8R3cr8v0xeWB0+OsSQ6kgBM8lFrzL2fMzD8QexoZqyHwGpgzdNxzNovs2OGN/wOY
         sa4EgW8Rme8MVsngHnmJMmj7h66UCHYzjGXvA/nBCOHmazCiuiDlpXhp9M0NqWCsTGha
         Rk35BIt5d8grAC57fcUeK3mWB05hWoNbDELVkgJx4YdHsxFafzTY6cM/re1y1mkfwf45
         bVc9x9cFNuiKh7GSkrL9Bgkj+RkXV7w1ftbTRad8p3l7qdkAJfPQoBScnD+7i9k7c3s0
         JavfYLD+cfvjiNRyhSYVmV+x/ELDmoyqtYqMp0Ag14+Xoc6o2KMWx6tfioesAsS1KaJc
         KlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537040; x=1792141840;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/JIy/pMq5OkQ+wPHl+YKwojqjh6/wHrpuO6FCK/Wi4=;
        b=oi7ICAL+t3Wr9xfvPkoMjMhFrwR+9gyafgFji0aA8Dmn3D/3DXd78PK8fOiayn9mkQ
         ZK36NN7ZJHi2aTHaFAP+xZ4h3KdeK6uVci86NdpbyrIrsvGUU215dtvk4Nml19Di7X7T
         +ZzCT6WdRw8ZNY3YEFHY+2ol/SisoEVxc5QuyYf+QZMn7VdfhFnV0j+BJU6PcOZM/zVG
         t12cLDJkeOqur0UPBZqLnMESH8IorGR2z52p4m2eJljraHZcJD1+P3Lzp0arvlN54M1M
         TmHyBTVw2Oaldikd0yxKSMA5ElcizmyjKzp9+4kJVJMGCErAf5Dp6q/ILRHsJCsX66/o
         7Wdg==
X-Gm-Message-State: AFq9FYJzGk/mowrAzny+gbplobfqWb+QjzrdP78YvgFs9Xv1Vc3qkITp
	Bu1g9osRClYvlgDnuqFKbi0AEbOjxVbeO7WtspDKNFtoMTx1QwMrypjeONJwrLhlH+U=
X-Gm-Gg: AYBFou1rkmcvEyCarZRNNdUMiPO7q+iG9yYscltgV+dVaXjHeglRnN1QzfgMd4U7Bhr
	j+i7wubcdZChAg54p7wFPl61DxXaf/ADttTHQCL5ZntD+x45dmRiglQfWiJ7+IElJWwF8Z5OE69
	gWmA1U6B8vzd2bzCANVhMO4S0S0/T9cG4wWqUjHeielE3A8qJp5GLHdjR6jxP55Sd5coBfPGmCg
	q+6lkPWwskyLFs79rNnJ8WNWofkZ6tDbgwJTyOBxUywaG8A32kpYyFv1nmVLyLQwZqbWhn9k3de
	cdsE7Dmj9oRsqaXVua6JnpwCkrV5dGMad26QAnDPmjUkP/fIPF53JvppDqpST45HRTBRZzepc79
	jX/9y97IvmaNxhCfDSd+260nKwwPb5Nxl9m54mDUBg+xkcOW069pya7f/UchfXVi5e9bLLirVct
	xx0v2xQGPJoedZpuPqStrtZali1R8EubwanjueDWqiaCMOWNJOmM+rTYz9c3bU/CMwknasbt/zR
	xD8We1NmNd1PQzRKw==
X-Received: by 2002:a05:6000:491c:b0:488:8546:d0b2 with SMTP id ffacd0b85a97d-48dbacf06ccmr2124854f8f.51.1791537039476;
        Fri, 09 Oct 2026 02:10:39 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463499sm2693592f8f.3.2026.10.09.02.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: xilinx: fix NULL pointer dereference in
 xvcu_clk_hw_unregister_leaf()
In-Reply-To: <sashiko-outbox-164950@kernel.org>
References: <20261009061805.3172589-1-vulab@iscas.ac.cn>
 <sashiko-outbox-164950@kernel.org>
Date: Fri, 09 Oct 2026 11:10:38 +0200
Message-ID: <1jfqyfp7ch.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 09 oct. 2026 at 06:33, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] clk: xilinx: Use-After-Free due to incorrect child/parent unregi=
ster order
> - [High] clk: xilinx: UAF race during removal due to mixed devm/manual cl=
eanup
> --
>
> commit 7f74ba5d4aed358cc163ed1eb7e56a50f1f385b0
> Author: Haotian Zhang <vulab@iscas.ac.cn>
>
> clk: xilinx: fix NULL pointer dereference in xvcu_clk_hw_unregister_leaf()
>
> This commit addresses a NULL pointer dereference when a divider has no pa=
rent
> by checking that the mux is non-NULL before calling clk_hw_unregister_mux=
().
> It also removes dead code that erroneously checked the divider instead of=
 the
> mux.
>
>> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu=
.c
>> index ccd9d7c0b1809..58a9762ef20a9 100644
>> --- a/drivers/clk/xilinx/xlnx_vcu.c
>> +++ b/drivers/clk/xilinx/xlnx_vcu.c
>> @@ -516,9 +516,8 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_h=
w *hw)
>>  		return;
>>=20=20
>>  	mux =3D clk_hw_get_parent(divider);
>> -	clk_hw_unregister_mux(mux);

should deregister the divider here

>> -	if (!divider)
>> -		return;
>> +	if (mux)
>> +		clk_hw_unregister_mux(mux);
>>=20=20
>>  	clk_hw_unregister_divider(divider);

this last line should be removed

>
> [Severity: High]
> Does this unregister the parent mux before the child divider, leading to a
> use-after-free?

Yes, the function clearly has a copy paste error than you should address pr=
operly.

>
> Calling clk_hw_unregister_mux() first reparents the divider to the orphan
> list, but leaves divider->core->parents[0].hw pointing to the mux struct =
before
> the memory is freed by the mux unregistration.
>
> If a concurrent thread registers a new clock, the clock framework invokes
> clk_core_reparent_orphans_nolock() to try resolving orphans. It iterates =
the
> orphan list, finds the divider, and calls clk_core_fill_parent_index(), w=
hich
> reads the dangling entry->hw pointer and dereferences it:
>
> drivers/clk/clk.c:clk_core_fill_parent_index() {
>     ...
> 	if (entry->hw) {
> 		parent =3D entry->hw->core;
>     ...
> }
>
> Should the teardown strictly follow leaf-to-root order (gate -> divider -=
> mux)
> to prevent orphaned children from dereferencing freed parent pointers dur=
ing
> concurrent reparenting?
>
>
> [Severity: High]
> Does this manual cleanup race with the devres-managed OF provider removal?
>
> Because xvcu_register_clock_provider() registers the OF clock provider us=
ing
> devm_of_clk_add_hw_provider(), the OF provider isn't removed from the glo=
bal
> clock provider list until the devres cleanup phase, which executes after
> xvcu_remove() returns.
>
> By manually freeing the hardware structures here during xvcu_remove(), the
> active OF provider is left with dangling pointers in its internal hws arr=
ay.
> If a concurrent consumer invokes clk_get() during this window,
> of_clk_hw_onecell_get() could yield a freed clk_hw pointer, resulting in a
> use-after-free in the clock framework.
>
>>  }
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009061805.31=
72589-1-vulab@iscas.ac.cn?part=3D1

--=20
Jerome
