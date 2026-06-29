Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137073DCD83
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727586; cv=none; b=CNdfKS8FKak/Zrn+sh1oj/3Zu9ldRdHIqxjD6sk7jH0rOpJuz0uYku9MjqmaddUtOI5gyXZX7TYvx6rFuxnubUigAak51BJjC9Mlb3UBjWxzsiVhXYesJ4WQlR9tQ6KLFH3pve+JbuBnR0WS10Bpn8NsPFhelpdeIyMbTGeU5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727586; c=relaxed/simple;
	bh=eYrZuUDW54GVV8/zA+Zs7S0GCSgEOyJGq3UYJVTrPJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7ZsdQQXo7U1M+TMwAfNNeC+NuhlaFOSLyGndMVVBB1BCxZ9nedBuy/i9r5fKJSTEt8zq+lfL3EyFJkz8DBA7MIuV6xQrs/9iLjAy2zS+/mIapgtrYVd8rlBFTYdWN9Xh+JAnjQPcjNgLKAHyBEkz5/Y7/PsM6dVOb206Bc0IA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqZ7xCHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2u3lGXR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqZ7xCHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2u3lGXR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xmtu2432112
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=; b=MqZ7xCHbU1O4tss5
	EMuW985nkiThlT3+GsjK3ceVrdJuznujEYmCOJYJlPcy2hDjSRSBLI0qofA8W3Df
	UHspn07PPrzMDWwOvJI5Qpn1m2PHQGN2TmD0kf9mA8JL2RyXxR44ndHznQPt+BMO
	VlMR23Efa7mhmgwVR/T3CJjflWI+LPBYyNyAcjgnFUcu6ZGX4sW+aVt31Cv1Aa+f
	7H2ZCGXJLwF8gCLP7f58JXPPd6UBVusZLffrQ5RxDjwIPfUZNmWa5Jjjkisz1SBv
	gEpeffsGZjxTM+UeDMDISujGXSAcdiWYJIHnne8FN3A9xH98a1KixsWEy7LKC1Jt
	ChXDMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper9n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:06:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so701421cf.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727583; x=1783332383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=;
        b=h2u3lGXRGjNIEBh/Ci+2zLvpnbusJTRKsC4HUkcss2VdtPnKzENwcsNAdepL8TnXI5
         o+4sBXmiYKiq3OLTLiC73hucrvnpdv8OrVToLmvdbnrD6Qh4DRe+kqFd7+q6p2p2mRAb
         t6/Zph5aCC7+m6QcIjBsuBN0eNa/k6PDVxdKzM2oW7xAOoEEMB2GAyOI4b0N8Ik1KHuF
         Fk6hZ0IIwe7K7Z4ITZShsxW1hNAXPmUN/zXBrgIaBuJ8lpeNnhQ9AVoG9+CYqMmIpKIU
         +oH+okEyMn0McjUxmUYRF29jMFyV5vctYcJ6kQrOBm2euly2+YfLXiKxpjAX4GKAm+Jt
         VImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727583; x=1783332383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=;
        b=M6FiHsdPtY14WwXYP2P49wh4WWvcvSlDArB3ll54a3I89pmrC+BbvJP+zW6nA+zYTY
         j/vjaPTckFSNsMlbedEEm71tcut8dsvZUyzd0jif0AXI8EVedfhdX1745NsjA6W54E/g
         fU/qbEF4MBGFYC5ovVHH75ckfVfRX/3yNCD2KlHaPiJ/IPFtrdTx9uUu0STvGaG0Pjxm
         bPyO4eO9Ff6COps3KrLvqtypeH971tocnMS6Cjjx/rTicGgyixTNQSOW2l+X9ROCC+g0
         7HP262w42spWdUkFyjqP7Oq+yas9hvq0rGtDvzBgmIoq24Kdansciws/zlSZkv2sK/bX
         TzIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NFQYm+f6ULEYZ5o/LPlA1MJ10dmEtnLWXd1Lwv90vnFH1wW/ZW9YiKwAXufSxbBvg09iomkYqaTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9e8AyO+vSfEShpyKjJpWsriSMGMFlTMTGwARZDiJvK384Wt6
	gHUCSp4lAlHanprHUxmmxOx6J12uk8lz1ja6gxpGYG85l7yuHDTRZB+6BXXp1YoUtQnnVGp12oH
	ykXOdTDKMSWb69EZ8m/WUrIjljzumcrYb+YuX5/Kox4ku/BpWxG3m09N6ec00xuU=
X-Gm-Gg: AfdE7ckIjR5rT6t4LzKVB+ev7eMCib5wXR0KqDTWGWuLMvt70mnkr18aor3/t1RugYc
	Q87pAgTosAm+Hh23TPgDvC7Aah12+4gialjDZxq2rIpzM4eFOGxfiSISQF9pC1KKlG63YDrU0V2
	bTSf5JU2csd40619d9KohBVjMudY29zcMTvHhgwGlhuHe9MZ6ZFEbSBiqme6Nb9R+3ysooQDFz7
	sO4ChY1MguTKrohWWVVdASOWRYsRtF8V4GMJ7RdDOSQSqbcP0w6HWlA4A8BfCoqbONLlBl7WJj8
	3lwveSIteRBL0hI6PZqKwASSH0sWWdmj9LGNLyEOq9gmSZxHtVB8tsVvOYfvrYqieLXfl0VnY6X
	k2u+Oaa+LJFR101t74jG87f1yDH5zbZZ/oZo=
X-Received: by 2002:a05:622a:3d0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51beab3578cmr59352031cf.4.1782727583421;
        Mon, 29 Jun 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51beab3578cmr59351661cf.4.1782727582842;
        Mon, 29 Jun 2026 03:06:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8125sm747959766b.19.2026.06.29.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:06:21 -0700 (PDT)
Message-ID: <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX3O2oTLc4WCiS
 vpHSTDWSQ6nqnNvnBhjJ2IrTdc2bQir/wyrvW68/r/WJI0yxaZ2uWTe9rgrlK1MjTk8eyZSUCZp
 mb8SS7JLKzb9ibT+7K6L/cvWyQDVCFy3aV6xuqGw/4N7yGbKns7GxdprkzaWq+YoJUJda3HSjGU
 upq2fVz8J6hyTI+SGhA2SOL3TVV3XcKgaBvSp/can54Hih9p0iKnuumIg23fXoiTcsZ1bQ6Sgnz
 8nV+pcFGmCJOnJARS8o0Tqkx3lkyLEpOK3GHd1/8/kOPBTnedRmw0I+dBGmseLOnRpnDLPL5MfN
 G4N47WlBG6L6M4zfN/H+x/4piHy69GuqsA8y6ba6ZhzNpW7FRSkZ5DXUWLKMkAlqGRWsp2BB9bo
 4ejGFfGWZpA5nVaghGEzXoAqeNSAXYp7V5eSeBrcgjD0QPjTOciHdTxAUcRlk4h48N3eEyUqD76
 dXaHhYL4hBNquUEJMJQ==
X-Proofpoint-ORIG-GUID: oxMWlPEyH8QyCm_hq1D438EHENUSVLvA
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a4243a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NDI1EqwwtgGkLGOeOxsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXxhZfbAKLkevh
 Fj7TGWgQ7IblmV97qwDO8llecZTBmdNrttjpC/8eIxkhTc7h5qBHh+AifUPBUM+VmH3gghB4ioV
 4vppCqpo1cjMQiwgGYNxrVpqabBZP7k=
X-Proofpoint-GUID: oxMWlPEyH8QyCm_hq1D438EHENUSVLvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081

On 6/26/26 6:32 PM, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series fixes this by adding support for sync_state to the clk
> subsystem.
> 
> Changes in v3:

The version tag is missing from the subjects of the patches you sent
By the trailers, it seems like you used b4.. did you play with
prep --force-revision by chance?

Konrad
