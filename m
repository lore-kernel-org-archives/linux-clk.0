Received: from sonic309-21.consmr.mail.ne1.yahoo.com (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AEE3D16FD
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956665; cv=none; b=Du8zWFp0Ba2vGy3P497pAHziVNEWKm85QyvzZhTk2hU0YYpF1E51POorw3waSWBEimOOXKXFfRlmxF5ZVCjA5QinZ22D/OBboPFgOVG7+V6taIpnHRxidOGTG4Q3wvVlWRkIRp/ArZ2RuXCXjpJLWnlLwvzX2UdkIFFaQLnIXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956665; c=relaxed/simple;
	bh=872nyeUESCO50cOAqgj+xeiSzSDWlRs5vEPZkhvRpG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQuq0FjyTJte0Tb6bptheqZ5+Fp9TI+8KDpFilh9Z0QBVV1t4Px8YEkv6ghJnv2v6wUn2BilP+uGMDdg9+bmnN2XVXO/S24mwQS5cGysMmJqWC6s+fNC4rqLfpUheBxX2gvp6k0fNsM1iElwNaq8v1eN1799KXpSFYCSuYrYMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=nPeidDmy; arc=none smtp.client-ip=66.163.184.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="nPeidDmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785956648; bh=gy12VoKrlG0xMwQZvi1jCEXapKjeFbH48ffdim5dqmw=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=nPeidDmyhgOVpSRXgfDD9o5Hk0Da0J1nnoRNv00BquwTLjl9UVVRu1Q1gQxoVieu4WYNdiEUL+ChmxlIwMKtQGMsSEaoladVOBuH+1VkaSIo2mhtN5pxDFxQcYIP8G/wUOOaluUJlDwyxCxJhJkPr3Va7ECm/mhY4GRn7zUJJmAeAljXTnv0pGzHkbLTeOyJ/Px5inKYWKhRpf0XYjtWkgYCu7CyERnUpDzFDnKNueb5I54yb5+LyDfXOUTG9e/l8XMORIt6d7ASzUCCfRVE2rdzoT1Kjwrf6tMAQCZuswq6ACmQk5qvyLNFYHDDhlEbmYhpIS3DVuyL/PquKnGXQA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785956648; bh=sW4GXjeMIsBS15E7Ak8a3SH+/xENt7ue7aSX9bOfc2S=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=hbcbWeC37fpw74YTJm6MGmWeZ8gr7Osl81VHtU56fWVYbkt0URLa7LmPULgSTjVdftUDNA4dmsjX7irxvIbDJJbyCzvq+8omMOV+T4Ra8DUw/OuYmkbmyt93omqON4856DjIyhOrh1KYiPfPHhNBaRW7GcU5ky5TzgQJlCnrPLu0nQTpiqShgwop/9uLq6nU0H+wcDHUFKr7CbSL7ADSDK+9Jkc218aDIu6qUxnfc07p6B0+4eZMyUp6filH92KYODWA2diSOp4TwZD95GUnB5RrvsstcKPVx2s+q/RCAS3K4GTCtXA343OzPlmaeHnBqcP+h9tUFNrKJX+xX0vMUg==
X-YMail-OSG: S9zU1VkVM1ml_ypGr9R6Wd4DvNmfgpG8lvLFpRPKelrhP0fWCV6Ur6ZweDKmJU6
 zF62ssO9llyfHJWpDg8yGMiVxwTza4hLwTj4FFeE5BQKRMJFdEiOJADx1ldjqoUQvE_lgVvqgtHp
 MPdjjAjmGXaE5WHWIQ9a9MM8p_1XEtWD.TdgpdB7wP4lZZZAiI_RAo4LUdgWQ5VsOELQVL7.WD4d
 xNAZQbK.e2LNhkemps0lMeM5tif9FDTSR4ew0cxD33TDUT9zT4Xzo8YsVQSR20bs9HrDdqWEXaco
 HqhhHUXPfBPGyEh.yKARCNpihYhnoVW13G6kXqtZoPhssttjLQ3rxNOzBIeNNF71FtypK0v9A6op
 oxkp8FMkRAvE8c1yzWxFiUCWb5AEvlrABLAJpQ2.jaVurqTmEUNS9uSNxKx7oX4GToCvcoYEmnLh
 4Pt5MkZiTL0ewAlHzZzF6o5hezJlKzRkeaM7gaqUwoEkU1.5.adxB9BLA9XkSLf80w6osO_XDbmM
 va_Ip5gBemEs3H8tfhgeh_lRDXXqRQxJlODPlP8OE2ivevauR1ZDo6y1MkFPC0LgiJL4wDaNYFTv
 AEFnJuFzWStJPNnTvlL2EsAXqBR4WjpVTqKINSlXdYSymWzPy7bS33Y4KMa2cVXdXp9RLw2zEr45
 ZQNnJMrNEErn.z8IMjWObh4b8MbVCrGL8NajC0Zlr8adxj2_vOs71U8Lbkp9XVGNL9s9Giv7vjED
 KqkRUSm8JoltIWAsP10tsYTj_M1gdEANg5t_thLUCrF7Kwb8j_Vvm5zxG8BYSLXb64F5jWI2AuC.
 p_LE_bt_igrMrPF2GwersntYgn5sRazIhTCCoi8S7.z.tbtVnZOrq4lFmqce4gTleC8HlSB2ycTJ
 4SY.cKuIgcp4zDLkRIJPlxySL3fr8XlYRrDyCN.jocqMHBfcQfsnpd3zoORJ6WPPxf76Nn9bZIKK
 cTbfdyxKwP7VOtJ6PatHrv66av6o4dSy_IAGeGQhrgJSyqvs7rSpK90SsOYgfnegb5lpOfKOdhD0
 I0p.MYfrwT6C0MmHbfOXBfA06Zs57NS4549WndgV86qwbF1Nc8T9S03RHOwZHIgRGQ_GOM1Ilg3x
 qwVwnsBbPOi_ZD2Cyvvlzk8X0nvoXU3vaunrH8Nz9EOsaK0KW_Sbb08F208efE6ZpoqK6qRgIjNZ
 ZkDTAjQBqOSCzAO68QiV78A21a_Pg93NiaDt4XdEyvbytRuaFa9h82n5vqM02lj5aUZrgQcG9EGR
 W_biV_IKZgyBpAXOjwJfgWGSCQAlGQ6zIIYLUPfvUIA5qIyzlkC_m1aDuSJb5KG3sZtJuwwpYYyB
 JRuP1AGIQj3cuJ.T7qCN3phO5cZKT0rIDjA3vunKROJDWvQ5fiehi45I4D04N8TOVfo67mk0QGPL
 d9W5x3xMLDjpPG_m6dXibjcQl4DvEdiyKLI_.uOpCyoGG8C1QJU0HHLlKQQcLiznlmQOgBMKRFez
 oo0oUdTwO2Re1A38pJCDjJT.xd5kykOAKVsVYlQ_dxqI.x.s1bY1YPESRPdS3cakwx0_dcfBqStX
 M5LK_H7dQ1Bjg9btGberZFbIIesXNOsvpzLjUYjHDgQwd9Xa29a35o3VkZdvSbvKKztpmDVFkHIq
 4zXqq5UNa8C9Jt1BQYGyXf0bi1BaMCfa3ykPujt_MYhnbUtqZj750rIcyv6vKhrAHrjQDNNh0FPS
 Dz3Bmgv2x87ReUGicHY1X1ncxxHqsGFkQ7ZTNLHkQhTgoVAPEYzZdqH5fWG3eGQbmwh5HBSmtg5f
 eSY5iPJ1eTj62Yu9plQSqDTuT666z7xT4.kFSTUhqkO3bNQj5RmpUV2b.WzVsCulNYam4chXs4cI
 8mOmkUGcHMoA0KP4vzrGA.te.1S5yYZcUMEgZXuzXkwZlry6ljvPuwz6Nb0Bi4rn2.pdg9BP2aaP
 o3NLF1fHbthwNZcx7Txn70Gw5FGpyCJILVFiRFfE3qzGr_5fLSKsCdrMorfhd.8nL9vMTanBnZcP
 uL1u_5bvd5B_alDhOf3LOmWKc6Pu.tprfeGstQHrN0.LLruD6Obsmc6PEM2RUM7G71luefz2pZv9
 v6MdOPivNj.foAPq1OaF.pSCtgdOVr5pX9suyezUTRQZ4_1hkkLV1E4cC5NIFAtqAUpzQFQzmLlk
 WFJtHOfADsGveKCOBp8oXqZ0SFYocD8_7ec30p9qYcjyrZdHfTi6V7J2jtlc3jKeZQBZaN1W_bZW
 xEiuBV68FI5rHSwekEUSCkZ0pdAo_JprNWmJ3TnkcjTtWdbSs_WG5iT0EfNCsNCBcZ.KNkNxQ4th
 CQV8seaKDLAA60SH3Bp3Yl4eO.mb2PUs-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c239a0af-6752-41cd-a9bd-1cf70436465a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 5 Aug 2026 19:04:08 +0000
Received: by hermes--production-ir2-676cb4d88b-8kpjt (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 33776572d402f77734bd94cd7cf6c2ba;
          Wed, 05 Aug 2026 18:53:51 +0000 (UTC)
Message-ID: <97efcff3-c625-412d-800e-ccf8215f86b3@yahoo.com>
Date: Wed, 5 Aug 2026 20:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Jie Luo <jie.luo@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <20260804115359.16633-1-kuncy7@gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <20260804115359.16633-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.26180 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 8/4/2026 1:53 PM, Stanislaw Pal wrote:
> The probe function takes a runtime PM reference to enable the GCC AHB &
> SYS clocks of the CMN PLL block, registers the clocks, and then drops
> the reference, letting pm_clk gate both clocks a few milliseconds after
> probe has returned. The clock ops access the CMN PLL registers without
> a runtime PM reference of their own, and on IPQ5018 gating the CMN
> block bus clocks makes the SoC hang on a subsequent bus access: boards
> died silently within milliseconds of the CMN PLL probe, up to a 100%
> reproducible boot loop, depending on binary layout (micro-timing).
> 
> Take a devres-managed runtime PM reference in probe, so the bus clocks
> stay enabled for as long as the driver is bound and the reference is
> released again on unbind.
> 
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ 

[...]

> +	/*
> +	 * The clock ops access the CMN PLL registers without taking a
> +	 * runtime PM reference of their own, and on IPQ5018 gating the CMN
> +	 * block AHB & SYS clocks after probe hangs the SoC on a subsequent
> +	 * bus access. Hold a reference for as long as the driver is bound
> +	 * so that the bus clocks stay enabled.
> +	 */
> +	ret = devm_pm_runtime_get_noresume(dev);
> +	if (ret)
> +		return ret;
> +
>  	/* Register CMN PLL clock and fixed rate output clocks. */
>  	ret = ipq_cmn_pll_register_clks(pdev);
>  	pm_runtime_put(dev);

Does this error path leak a runtime PM reference?

devm_pm_runtime_get_noresume() returns before reaching the unconditional pm_runtime_put(dev) further down. If it fails, the earlier pm_runtime_resume_and_get(dev) reference is never released, leaving the usage count elevated permanently — probe returning an error means there's no matching remove() to clean it up.

Suggested fix:

ret = devm_pm_runtime_get_noresume(dev);
if (ret) {
	pm_runtime_put(dev);
	return ret;
}


This failure mode is rare (devm_pm_runtime_get_noresume() only fails on devres allocation failure, and undoes its own get internally in that case), but the code as written still leaves the earlier reference unbalanced on this path.

Mieczyslaw Nalewaj
