Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1CD3E5EE3
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703024; cv=none; b=SjZrllQzEaILLe3Mo4iSeyt37fXtUC3l5nQM9c0bazw50xpn3mcQth+Le8pVoDRARaBOLRr5s/nkayvtTCuhWxYmLrR1FKbSjFvPvwrhdavVAQjmG5AyOuT5cCATAH4AHiJLL+oy+xc44PCX9Qi0jfqfBKMqFnEuHR2/NdCCMwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703024; c=relaxed/simple;
	bh=MgR93XTU1mq8y2aZ9hWPpI2kctBBCnxVq1k/OqiBpNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9xWRIw/oyT/GyKddIl4MIdNEG73U/6RDmlEZ3tZ/3reex6NWvF7VLT6N60yz6fDQ81ypx4dJhxZqvj9k0KIfKnOOC+a55x89VZbMotUCxwxt5YYwEn0OXA+q6tw5nOWWCGXY3bkwahnb9gSjQoLXW4fU8T6KmfnSA7HhsTvmaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfEffcXO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfEffcXO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so5044210f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779703021; x=1780307821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cez/cnYMxxZmQ2yyzCf16xYcrSK3/MCZDkpw9VeqbqI=;
        b=AfEffcXOY2pm+1R4AaZVi6AyUialZbr9D9JNBm1ZI1818u4mp2QkdyjEXCD0R1OgGb
         XF1rPqTYzpDMo7zfOZLssRUwXCLagyGXGELHg+c3m0NW6CnTfEzVEzjd8XLD/c7zC9Vd
         89hmTEK69JJR7Bk5J0xGSBceyw5TUUMHOYBRgjZBvgNGK2WMwEIJ7Rf+FB5GurRPXyht
         jYAdlve99fu1Y0b2tOfpwRQ+YdBAyc+ZRphJfoHYE6qOUaC/xt7tE+mR0wrBgWjiOk22
         tigmVygaV1VMAsdnEONqwa791+ncG+dnwj/Px+kSy/XRvs4p+pW4vZ2Ksn86BCIwfAWU
         sL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703021; x=1780307821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cez/cnYMxxZmQ2yyzCf16xYcrSK3/MCZDkpw9VeqbqI=;
        b=GuyezamN2V2IgYmCsjXMN2efjOm4fzdDWjmzfB8UGgKjNvbePASVHMsRm+I+JIcRlz
         i5fRolPQRYPifwawMYaIftes/eljJznW16RCqfX343fffizd9f8sSZ7yei4CdkmnawKB
         cDHFwzvQ1hxrr59h7omxS2bGE1J/6NITCklByLiqc6vgqg/nbBfp1moGR2b1BrNuY6wV
         jCl2QVfT4J5v7KA17felKg96NCck0rtRWGQOLYGbFzIKLCCR+Za1mGmsMroJpPsh2A8S
         mQikwT/JKHCdHRY7uRRfYiQ2EWtFTDOA9YmXgyKeBBaB99xO41LtfdjpkBjNbE90qiXT
         /m2w==
X-Forwarded-Encrypted: i=1; AFNElJ+WesvvM/xpkeucVN9S4XpGTnwr06XyeR6LFpT0lIqN5lULdRn0Pk6xlP2114IHExTbsm60VLv/NAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjL7MPhBF/iY+D+ILBpJTxmkJiaHdPjm3UxoPZPulK9TTrjCC9
	XPu0puyUOAafBNRWdTJJuEulhVFoiBDSs3f/oMsXeD1jhGvRQvNLvCMc
X-Gm-Gg: Acq92OHJ/MPwChMnOuvByoHBlUhvTczZ8qgCKwtFj8OHgWAUFZC5jSHSkOTCyGrggzY
	Md97DVSP6Ldb1f8K6F91C/104SaXfeRLHGxobv90io2CBKhtdCGFrxMk1j2pGUFOQiI1bduKpHf
	IvdafUoGwKnhYgq3nPQ40WC79ffWj2h3OerVWGJPBjXG0MI+OkfvVGS2eIRkJkcG89wHOKxwHYj
	5ovC/Gpr655XKTZIbs95UAy7bDYULUgIsb1MitNvO7dM3dwCDnLEEZ2zh2DZ0BeA+qKvsAPN3+B
	gNa1sU+YSueDFu5vpovqEVdYUdgNPRgHmJ9ipT1+qh8z8y1TsaCVxgRPrjjGEmI7gXsdJqFcDqZ
	UuLia4ah8GyBpeUeIf9D6xPTOdu8AcLeWo/v+8z0hiL7vJ8/In10F6K+wRtQCk14os3iKcfETbA
	wqiJPdzk+h6V8QCNxqcV56zBgHwTurHu6O7+Dsa7BO190paxOL6WH0CJKQZuydC9fry9wQPBA=
X-Received: by 2002:a05:6000:401e:b0:44a:247e:67b1 with SMTP id ffacd0b85a97d-45eb36920e5mr23940884f8f.5.1779703021283;
        Mon, 25 May 2026 02:57:01 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:5a27:4d10:c059:34aa:a542? ([2a00:f502:160:5a27:4d10:c059:34aa:a542])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd151asm25354818f8f.13.2026.05.25.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:57:00 -0700 (PDT)
Message-ID: <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Date: Mon, 25 May 2026 12:56:58 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/25/26 8:51 AM, Taniya Das wrote:
> 
> 
> On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>>       .halt_reg = 0x4c02c,
>>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>> please use .halt_check = BRANCH_HALT
>>>
>> If I do that, the clock fails to power on on boot.
>> [   20.324488] ------------[ cut here ]------------
>> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
>> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
> 
> 
> I am hoping the Venus driver has enabled the GDSC before requesting the
> clock enable.
> 
It does. From 3/9:
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+
+		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
+		if (ret && ret != -EOPNOTSUPP) {
+			pm_runtime_put_sync(pd_dev);
+			goto err;
+		}
+	}

 static void core_put_v1(struct venus_core *core)
@@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core,
int on)
 {
 	int ret = 0;

-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
 		ret = core_clks_enable(core);
-	else
+		if (ret)
+			goto fail_pmdomains;
+
+		if (!core->res->vcodec_pmdomains)
+			return 0;
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto fail_core_clks;
+
