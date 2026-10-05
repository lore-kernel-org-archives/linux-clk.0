Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE0C37B020
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203709; cv=none; b=sJEfjjEstSRAhH4RaOif0FhpJBovPPUJ/xZMT/vY/tPCqcd4o4foP4g7aVIBZhSieVpE92n3QVNzlyB+UkRdW49Z2yqUqmpaxxUYUh0jiM4H8PE9X8z56VBywzlj3V5Rko2qWuGwuvZyHEleRFyfSTVDcagtL2McXaB8oT+RpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203709; c=relaxed/simple;
	bh=GjpLzScGvDT5+IF4EJ/jQV9Td5tyjYNGeOCPSv5ZJso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWV+rcK+stFk/wyL8O1ejGH60HhTX9+lTlgNDY5cHSB+ljt7nruX7x4IVyV0r+QT50QD+jc/RekUfjV9aFwsgtvBXdSneS0+Wqp+FicfkDXxYFcgKIlwF7UVKGgFU8pL2M1zaGvAylxHeyI9HdPS0jQG4/bk8Br7q/ew8douKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nvxrct9e; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nvxrct9e"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so1019590f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791203707; x=1791808507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtOkhtouXdYxuMzn6oEg118/G/+iHWMuCiEVkeqGr/E=;
        b=nvxrct9eEUPc/BpyE8YSa5TzfhT+r4AvgpD2r4QT3A3o1XEgVXuustr2Wqd5FMDF3f
         kevV4J6cAeCTZq7LOv4jUdY5L1s3aGCS5K4Zj7j2/fTxq5iqFE7GaPC13JKT6LE4Qfe2
         kuIGeFIttRvjk6X7GOqw4zgARwRMDgwjhdR9vOQQTv5cDuMhIlBWfpPnCH/Hn8cTGoFv
         XLpAMkTOgMbLkOyctgaA4sAuluXJglrmEYCyHJArOvBe5ApAiiqZd0K9TJB+4vDOdQHV
         Q20DIYn2WkCF3aqUTgnOnNjpI8qQC91pLnWag3+O7IYs/gg7pZYvcW+nvUgxr2SNE7Jz
         o6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203707; x=1791808507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtOkhtouXdYxuMzn6oEg118/G/+iHWMuCiEVkeqGr/E=;
        b=zHIgFnf8hBEfNY695dDAKEAJVk76iA7iDb0+kHhZVCUqGnkPMRdTgSydtI08Hf/jWJ
         dCL8YElccsKYy15TRqyEAMv8SdlL1wTR970Gnj8G+ZN4ISIzJonWkZhXRshLhM3hd8mg
         Feq9tJW/htXZzOod80XopK0UazxfpMwvFOfu7k9wT6K8iBSHcfW2qUhdFPLlxIVpdvJj
         L+v9ZbSakt1D67C28tvVMrfMWIcRG+payyTS0wzACCGO2h1XSGWfaNcIC4QW7cuBlqe1
         oliNt5CcjfVB71c5Gn1vwCaTfdlfl7ItrY4V2aQlDm7jZbe5vTjc9smWG9lK5lrNGWH2
         A+YA==
X-Forwarded-Encrypted: i=1; AKwUvBy978CuFAdYbmr5Tyh26xW599IdsXqhq3vHtiWVf8AzQLdl8iTBjD3DpiZbIGjbHSlwnlb84km1KLw=@vger.kernel.org
X-Gm-Message-State: AFuF++nLjGVnkXe0kUYKWJmBMm0h5SFIwJads5glwegLG4zTQsk74WtF
	eDJ1SRKIAaaoqg0k7r7Tct1ZXg2Wnzh7UJfG+T36VnDjLQdc0J7/Cp1739sAy/4JQq8=
X-Gm-Gg: AYBFou1/WoiBuybu7qMkYOrdU5tDqhhdvuWi5EnTDcjecrDvCGgX1HSyWhd3oDo7V51
	gFr6hjNP04tLsfE/sldeIJjTV7UnDtWvOE+NVwtXWI8hnbTOYAjpkE3CCSfOLO7Pa1NRXk2xxEs
	3NY05ZOPOoxnylkwSSinUye56zpBV7Aef6VYs5TWdNy9YloP5/KUj8N9rUDcmwh4bSXmi/lnn1z
	HE8qSPtSqhOnr4NngWHXwTmlCC3XMHVYvXPzYOLaC2/5err6eIglIVupq/C+tpNzvMm2nAUHuKl
	7Ibv1476CZtaKu9WxBd+6lMIP1MIJKEMXMIRsEmuC/Byi0ZOqtC48G54LkaANc7Y46etx5VyN9+
	+tJNY8vYw+/u8Said4TieG+BpotAuSv3BD/YEq20JQMPhZuO9RIq2UhXiDRkkXuwsYFGvK8WNh+
	P1rfA2THakQeFX2vgwqACKkAFp6LP3Y+mnRpLBLB7aUBxfvqadngba1RYiABBi8wAs9dyZX3j14
	Ky1QPoZbJs=
X-Received: by 2002:a05:600c:1f8f:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a027698a2fmr183289125e9.21.1791203706473;
        Mon, 05 Oct 2026 05:35:06 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a166bfaf73sm169425895e9.4.2026.10.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:35:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:35:01 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
Message-ID: <asOZdcWpfEtEm-5X@linaro.org>
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 10:53:40AM +0200, Konrad Dybcio wrote:
> On 9/16/26 1:05 PM, Imran Shaik wrote:
> > 
> > 
> > On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
> >> On 9/10/26 3:44 PM, Imran Shaik wrote:
> >>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
> >>> every clock, keeping them non-zero until a consumer takes over. If there
> >>> is no consumer, those clocks will remain active in the idle scenario as
> >>> well, and the sleep vote is never cleared, blocking XO shutdown.
> >>>
> >>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
> >>> keeping other targets unaffected.
> >>>
> >>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> >>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >>> ---
> >>
> >> Are you booting with clk_ignore_unused?
> >>
> > 
> > No Konrad, clk_ignore_unused is not present.
> > 
> > Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
> > during handoff. If no consumer takes over, those votes remain active,
> > keeping the resource ON in idle and preventing XO shutdown.
> 
> I re-read this and yeah you're right
> 
> Is the handoff functionality necessary at all for non-icc clocks?
> I'm suspecting that this was just a port of the ancient msm-3.10
> logic where the (modified) clock framework had a handoff mechanism
> similar to today's sync_state, except the toning-down of these
> clocks was never added
> 

The purpose of the handoff functionality is to sync the RPM vote state
with the Linux vote state. Since we don't have any "read status"
implemented, we do need to make a vote for every RPM clock to guarantee
it is in the expected state.

Simply skipping the proxy/handover votes does not fully solve the
problem, since you will still leave unused clocks enabled by the boot
firmware always-on.

I don't think we need to force on all clocks though, we could probably
also unconditionally send a "disable clock" after sync_state (once/if
the clock unused cleanup is actually managed by sync_state).

Thanks,
Stephan
