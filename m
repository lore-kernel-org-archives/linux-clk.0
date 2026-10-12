Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BCE463B7E
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795656; cv=none; b=LOnvxTHvg1XR21zlx6+XdUUIK0TudWaYVcVtmfS7DrHkLZ+n5DsheMO9Cop3FpzSkXTaFBIaPxjVXpvZ7suUsZgu75m3fRsEb9v0iNctwwg9sOpvaS4Yus6j/CpCJqiZQestkJC7cxEoIv4GHlPVLOPMwFkxB2PQz33MDdSw94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795656; c=relaxed/simple;
	bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=peKV2lcWgEJvba40KZL0qzPgjYaBgrAvi6rBNPOdL3Wy5apMXUti5+oUMKHeotwqalB2bYQ4OuYU4BUP8nP+3d7hboRZPnekXvWhwIbeXyZHIGdlKpxmhfq/6ZFCtdDXgpeCCEK+qlVIG6JWvGUvHwrzDalGt6dCy8rTa/ig7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChNDmxN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5ax/Spp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChNDmxN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5ax/Spp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KnKa2181519
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=; b=ChNDmxN/poNfNEJD
	ncPvnzQlPVkG+T8Gn0BwBHidO8EHW40n0TkNWBujAkYIuHsJbYQS6WojfODJnj27
	iY3ugcHRVeD3muaoqjvQT4ZUbt/SPUTwGgkjh++cAnC1jfHLW2fGqZw+5Y0fW3Jk
	Yw7wOttSPZjYyUoSpcC55Y24RNY/prLI/zCbW65I1sX6uOYsrlP/cbg98xQZzRit
	nKNeiIdDIqUR4+7WTrS5YXBZWeP9xYPRYlZlUdUeONFfDNU7/ddy+zeOkQnZiGYQ
	9rM6/cwmdmGM1TBR4dBefDC5XHDJ158BhKc4Jap0kxNfpb6UN63X0o7SyDCee0RY
	YuStqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rwt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso3918428eec.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795652; x=1792400452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
        b=Z5ax/Spp6k7Fe3d31Og4cFGHsYFbseavSLtDXDpOdtixPSo2XjrysqWR8PTte77hY0
         1sbPcBo4jHu0VrBvogOPNkYDyj6wBWWyoBPxW/agLb4/kEO7d7hirrZ1jeo9C7bzMbvk
         iVFXJAbpAFqCPOW7JQnmnYXWJgjry7ir/1GNVc4z2OlIR/Z12mIU/pMtY9yl51sgvTHK
         4zS6lGJUYvjpTU2OxHjsVPg2bMHgoW31fMnh6C/mvaKehyt4jMC1FwRmbsFAz9AOuYpB
         eGXfJvrKlJMBC8tdrVqsmqHUkmG2shjVuX6YXB2PpjZ06rQKgmSAqtTNVquWalpGa02s
         nCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795652; x=1792400452;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
        b=0FM68bhpVaxIvkE+mu8MHG/PClQWWdEGICW/3A1GyV8uLk4awHYQwonLek9RzIEeOl
         ClkJ0j1sUFm5EXb7u7ZnhJjbTQDdtCvKExH/DQ8yRudl/bPrW7wpsRo/+v8I0EUW2Dku
         Tk7cYDIAjRzlyDZvZgQi+nCZrgt0lW6BGNSrBihghxbhvXH/a090qKlMPTiYpRLroDzi
         JIfWrBJxoLFWQ3cShJjtWYvmQT+TkuR7paaLYyuiKVqoYY8fQLQ+tnmqAQX/5Jl7W+L8
         VQ2w37e/87kuDMdMTXyuTxIMLpaYnAIedDttdjmsuwx99mHcj1VSo2T67TgOrigEms4v
         gElg==
X-Forwarded-Encrypted: i=1; AKwUvBxDv6QaLXlFsz06Bt/yCEQvYPL7PnJlCZd7Sqf6A2S/NlnNFNs5eQvx/tTPWa1YJ9FizQw8+naByKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLFms2SjembXq1DHgl60bZX/aFC9wkqGNeI29fjI+1duNNhSjN
	yZySSl6eUGNZ8Jsx4rYuIwxOPOod9M/PbMtr+GnP1hHnD9IftBXlwUXTeur+hyFVdH8M9MZHMQL
	SOdqEWUklqa5nzHKL155ww5I6UYPW9oV7RoOzoSxk60K6bqnINdCCdm6sRVL37Yg=
X-Gm-Gg: AYBFou2KKEmJc2LswY3zivLZpc69TrUHXVh5unjfUGMSorX0SAFj/2iroAujc4fbJrc
	qBJpLap9dgBOCuuyw5YVgr+p+w2xTpDwB+YUsEzGLMQXJpGrf+KOwIrmCTZ2a0u61z0IIlS99AP
	YeESSvRJKnFvkX9tsMmTvdTyiEdJzvwTRVJCk1IFdBWQ4zcKLcn3I6oaMtRVrSyoCEzmJIGMAcY
	/aCYT3p8NBSSutZMO+Y9uCZ9KxOM7tea18taGhzckkioQeVbezkouhOGoa7veHaj4pRqgl5GiuJ
	6iQmedP6xgjbcQLv4xLTsEv7LiQwomaC4vNX4hluzZoh3ehZhIe0z0lDTh/LaU6phd67nFjcir3
	h3qTVMVN96/oCFtYKSg==
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr417256eec.10.1791795652384;
        Mon, 12 Oct 2026 02:00:52 -0700 (PDT)
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr417226eec.10.1791795651874;
        Mon, 12 Oct 2026 02:00:51 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm32288736eec.25.2026.10.12.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:00:51 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v10 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Mon, 12 Oct 2026 14:30:48 +0530
Message-Id: <20261012090048.2495379-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com> <20260930-master-v10-2-105207bc5275@oss.qualcomm.com> <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ztv9n_kzhmCUjhVVhsBdjmncQ0W0irUC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX+RhZVgAonX30
 OKukjEAj29tVxaddic8SjR4AZzQwyNQNq3qMvQtpVec2pbYVMtwmLnCK8+WfZtGBvrorkSik3At
 HR+HbNemlozOxIsOO+mxXiMJiR3JwpA=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acca1c5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Qnx3dWhjQnPlBiBVVhkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Ztv9n_kzhmCUjhVVhsBdjmncQ0W0irUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX4xqzhwruLbrE
 AyEpxU3Zky9JhvrCt0SMcgngrVlLb81KoPXA/eXGBZnN7dNivcVMtRE1tdF8pW45h+S7t+dOZP4
 OdQHRRg7MKxG4tbPscRUDM6BitcwkEBRl333XU6BCL0djr878mFyWCygp2MBq9g3d8YfR9C956l
 jqPe0m3zUaSOnpc3ynCbuBk8B8mNNVrNoSuMPLy6er8wXcTJpM2VMLgzHu6eX7CWfxsL2gSOzaK
 YALiSxnr4YfJZJsVd+HhdaZgCBpO1Q76eyuC+goszxzAX2FIvcVIul/aTPRRYkj76VQ9ZhMKRpJ
 +YkiAgZ4sH7YcWe2SQZLT73P/LH1fBQE1H56NlspxT522TsjGphmQyCdgfHskD3Vuf/rb/Rs++X
 keqaARqykEVhkYwA2p0phU6QsaIO1QPq35lyeAuHJa0HISqRMILyjIQTRqdeh008chVn40wvlvC
 gUwle/HnsSUucPUyE7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120035

On Mon, Oct 05, 2026 at 11:36:30AM +0530, Ajay Kumar Nandam wrote:
> Since this clock is registered with devm_clk_register_regmap(dev, ...)
> after devm_pm_runtime_enable(dev), the clock core should already mark the
> provider as runtime-PM managed and take a provider PM reference in
> clk_core_prepare() before calling the clock's .prepare callback. It also
> drops that reference after .unprepare.
>
> So this explicit pm_runtime_resume_and_get()/pm_runtime_put_sync() pair
> looks like it double-counts the same provider device rather than adding new
> protection for the regmap gate ops. Is the extra reference intentional here?
> If not, the custom prepare/unprepare callbacks could probably be dropped and
> the driver could rely on the clock core's provider runtime-PM handling.

Thanks, this extra reference was not intentional.

I will drop the custom prepare/unprepare callbacks in the next revision
and rely on the clock core provider runtime PM handling around the regmap
gate operations.

Thanks,
Sarath
