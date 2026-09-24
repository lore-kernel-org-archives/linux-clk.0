Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F83446B0
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242360; cv=none; b=ptcausjoMSWrcbm2sMC3lcRpGgLqXfAqnzKTt6E2E3n7e8HCC/pz3Q4dG6QmTquwdD4c3V6ma+lhWTBkZdrPQlqgp00fsBSVDLBC0evMyht1BTjmaBu5ebuS1GaMf6DFBxvMgmsZECZCKO5JowJlBPySCQOHGNRNJiRuQDe3/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242360; c=relaxed/simple;
	bh=rwxv8tLdSgWEik0hiYWE6kOHX12q7aE4xGYPQuj35g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8CAU/gTUtIUQ9nex7WwrrX/ORQDdl9LYMPDwXyvm0xaFFi/b3/WwGig/EsmLpQHARC7fvAeK4mS33Wg6l+zZ9fUA61FY9ZIVrgsoHM9pnKFnEbbdYx+iZzkqjNmfFZ1qwwdEK/lw9Xwe7OXgCKjF2y3KQ7nSb91qRj5pNTiGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfjCoWHC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHyqEEzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfjCoWHC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHyqEEzZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q8kS2238168
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D044GLB66qpCbxwLa31iTBfwL9c0q5C1qDPuwruympk=; b=dfjCoWHCxVPZ8bcS
	vtMjfKASYygu+TGxtrUydJ3JY/FmhufyuSHXI5rbSYJrE7Gr6fAs1mFVsKAgrzlN
	6ADJNfQ+T9Lsnau9TDj1O4cBZclAa9KWURGyjWWj+2SfXGDZRTh21nRtZhu6HxA2
	tJrMcw+Aw9EtmSZagqArXZyJ1zmBIZ+w+k7KPIy4sF98Ta/rmZyXYuIWWyPWCfEl
	h8TpPK/Ez9fggx7BLPRjOFva8UHNwoPC1g1+5OXkD2A9j42xjzygodqS672FiZuY
	lp9MqlYtA8mtFws9pyVWvPvA/u1wvUVY8GjL4nsoW6Boid2kR2dIMIrWX5YVr1QU
	AcfiEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbmapm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:32:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2480247eec.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790242356; x=1790847156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D044GLB66qpCbxwLa31iTBfwL9c0q5C1qDPuwruympk=;
        b=VHyqEEzZvPOe/q7pvji36Oe+83aFyA6rh1x5C4fOU7vIW7E/gg30PsD6M2aONcHVhL
         gmdVyb0VC8DDJOHaCpEBvpAQzg7iTT51FjHj9j89+Uh5MUPXX/bQ3g9nDRGKctwoGchm
         uFDS9IPD4gCEq+sFaY/3h0I0DlJeV4NkfJyPwzuViPgmhmYfGAHMlbWxLAVOqlZ8TszA
         ZRvJMDqCrnfl5nN/bXluL6iEQW+EvUi9XtGwjRvyAHRED2MNfx4lUUMmh4O8hvCwScZ6
         K7VnfrGHQHjZfhj7CPHMrVEqGwNBAbd+kob6GYz0hjlUAmXWWYBXdgsq1yqyZ2S8rFf0
         WpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242356; x=1790847156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D044GLB66qpCbxwLa31iTBfwL9c0q5C1qDPuwruympk=;
        b=Hc4solUzBTWRjRMXyIva8P8IdaBCT5kMl7CiABqbg94mTVE40Q333xMgOSdbkkkwQF
         ddN/vFdsLx7QsPuQpa5b5w4CVwC+glrJnBKCdQz/FbWAfmjiMW40YK3BDla4va+23i8C
         CPaE+7TZFbusVAEE6mdBov7qO2QuKi9m2CZmQhAAJKEK34KSbmDlRQLkYUWhnv+IKbRM
         nXkcwA5qBvUZIAZPKIrCWyeVMs43f8iTDd7X1IzZIRowK4SIQz82vi13WjcaKDaOJHIc
         M9+1I0HwADkQtJ73Vt5xbTXd6gBu6Rx4R5nMLPfUm+ulzfS9m84JqDGJhNEQopMR1kHz
         iKAA==
X-Forwarded-Encrypted: i=1; AKwUvBwJpzU8EWlkQkauW0yIBBBH99bUO5OLJv2C8N5AElXxQTD06C4lPAvU2j93fRVaKexEjtSBBpe5D6M=@vger.kernel.org
X-Gm-Message-State: AFuF++neDQOc3FxWy5KasndBmDt0Wu7aVjGik+uzUH5ZJsm9QaklxNij
	BVaiAJgwb0FUcZtTZoPunjsgWQbiWqynbJyrDtwidevbbtexioPe/XC6p50YKlt6vLyxQS4iAZc
	4Wl3azIjjUsq5U7HN/XxMBwdbtj1YwpBSpeYp6NMssUQTdedRFzau4/JW8ZLCeA0=
X-Gm-Gg: AYBFou0PsRMmN8NcQABAnqv3fvyOhsqwTcZTLHOj6IIMe0skoo5xpHVelWmqHqF7sze
	mniKOZ4wDDQE/eY47oNiWyZYMU/292oIZeDXUiqjzsUt0jNTdeBcKQZ1j8z19lTMTvXUk7e/qwy
	EER7qI/eDRVlw7OTmNfmjmY33ZrNFEZc95/U0M/fUoTQLyZ/xbdoVZTFDkSOjmmT68NduwF0KLI
	JX9KCGXFWNrysb3EcWuAC9qqxhdkixQDm3hEq7g1Mx5cySU7JlMcPw5QUcrC4tkh9BWwYCxJsGA
	utIUzAjvtOo2ww+cu/VzZ6Z8yAnfztLhLYw5Nwac6IaBjmSRlVIvO0BYgjnUkdhatskCkqo9RQW
	oKY/PB9iwMdutQzfQzuxuu73gMVmh
X-Received: by 2002:a05:7301:5511:b0:33c:e63:f2fc with SMTP id 5a478bee46e88-34000449db5mr1625526eec.23.1790242355965;
        Thu, 24 Sep 2026 02:32:35 -0700 (PDT)
X-Received: by 2002:a05:7301:5511:b0:33c:e63:f2fc with SMTP id 5a478bee46e88-34000449db5mr1625502eec.23.1790242355277;
        Thu, 24 Sep 2026 02:32:35 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdabcsm13400388eec.3.2026.09.24.02.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 02:32:34 -0700 (PDT)
Message-ID: <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:02:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX8jdCeK+ejCx5
 rGqDKpgP/rvApU9ku5xNWwymOoiWLejeXtxwuaIMy8J7QtuaakLBZBXzc95HPvP3fpw0gos67Po
 11vo0t+kHp3shSN14K3jSLYk3/n4QHg=
X-Proofpoint-GUID: kNKpQNgC82Vg-ODVaFL8gL7vgs0ird9W
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4ee35 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mssyiQsI3MLSchi5Q0YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX4nQ8FatIklPg
 8kR48ecAXZaLgnbVGq7mvRYtqDeBRN6whAVa2uQtY0WGXRQIyOja63ACYo0UGRsQL+GRsP33Y+h
 I3UQKc8G1UxfK3Duukr9vOJFCaWPQdbmUJZd4rkjiS8jXUr5+IeBq+fvbsFmFFq6V/stQpLhd7B
 2dsGFmLMf7YoXv732scZh/fWUmbngETR1sUnhXi64CZws480CgdxZ2/vgFoWrScOG91Ql1TKZ6W
 3ynVApHXtqNGFcODdlxG/MN3co0lnNvEwgEH7ebJx8pUE1JJZo8lKvWHEZW3fukgv8iDSB6YEhp
 63WQ0PS/FgPp8XlV+jDeZYfD19Hd0+TuXci3aCMlCaWOG8Yu5O9iZRoWby12tyPhTvgs8sZ2APN
 Ay9FK6QnMX+xurxEHc3NlmdAPivngk0m1cqKYuNm/vP0GxUYPLKgb2ep5ce5t5KpAunua4Obcok
 pY4jbvl2P1zsePIQ/tA==
X-Proofpoint-ORIG-GUID: kNKpQNgC82Vg-ODVaFL8gL7vgs0ird9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240039



On 21-09-2026 02:23 pm, Konrad Dybcio wrote:
> On 9/16/26 1:05 PM, Imran Shaik wrote:
>>
>>
>> On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
>>> On 9/10/26 3:44 PM, Imran Shaik wrote:
>>>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>>>> every clock, keeping them non-zero until a consumer takes over. If there
>>>> is no consumer, those clocks will remain active in the idle scenario as
>>>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>>>
>>>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>>>> keeping other targets unaffected.
>>>>
>>>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
>>>
>>> Are you booting with clk_ignore_unused?
>>>
>>
>> No Konrad, clk_ignore_unused is not present.
>>
>> Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
>> during handoff. If no consumer takes over, those votes remain active,
>> keeping the resource ON in idle and preventing XO shutdown.
> 
> I re-read this and yeah you're right
> 
> Is the handoff functionality necessary at all for non-icc clocks?

Actually, if any consumers surviving on these proxy votes on other
targets as of today, removing the handoff logic could impact boot-up as
well. Hence, introduced the skip_clk_handoff flag to maintain backward
compatibility on other targets.

Thanks,
Imran

> I'm suspecting that this was just a port of the ancient msm-3.10
> logic where the (modified) clock framework had a handoff mechanism
> similar to today's sync_state, except the toning-down of these
> clocks was never added
> 
> Konrad

