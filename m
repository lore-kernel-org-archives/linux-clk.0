Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A23EFFCC
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994491; cv=none; b=uk/HVolTeH4Z0Irl2OmNau2VIPlSXLc37gPxQHMo9wyu9OGF3NlZT+qGLE2izhMp/mL3Do5fI1L6ZA1j3+jai2YORgn5wnmZWz+tp/mvVXJVw4icO1SV+Ge0owvNL71aOH9TToqjxOc9caLdGdf2q3gZaWvLTX7LMelmXQM9qgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994491; c=relaxed/simple;
	bh=rXPxWsIC0j0zVW5eD5YHYqn3764rN12QzF9i6j7Ck1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK5qvnMK0fVxKa6BymXS8YBv5aZKAworNbu71+tXOVRNsMizBclckrmD5T5AfXQmL1v4850JIoSpoms8UM5iG23FS7wMI3hjoZ0edENMd//p6H1Dwu+IjL+lVHEn21lPyDUc5FeIuXLTu8s1vkKgFvMaYDWlPituJuoViAwRlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jq+vs0MZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4bQKvbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jq+vs0MZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4bQKvbv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbUIq3813218
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=; b=jq+vs0MZYkXhx12v
	ANzIjiBHTtI9EMfDXpohLhURQ3zpZsArBrZ6gj1N4tFPMQgrRC3dG+Hhl0N4/JV9
	J/FrCeGYZIMUlY3r4PlTSjhSnQgy4t5FL4Q31WMOLnbxLvMnSYpEIO/kLKxOSFMX
	8sdajDgct/zI62+leqRY7QULkMWMV3VAPUwDQes75q9tX26tulnjNf/4DzTfNcxi
	AFyvuuMi6O4ww/+eg4YfQTuKY22MAc2sPtnM0JWpaX1yJ8dMVWZCOqo3v+qNY3js
	70wF3SrRudbaxUKPBPqrBDhe2qAydrb4O3U5B7oDMjotfJ6yD9DklRJ71ihktAeg
	jzad6Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2feu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:14:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b89618384so5187736d6.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994489; x=1792599289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=;
        b=S4bQKvbvy8+/BDt/o3qGqigkVJ8rf0QGVqm0X4vhFb2uLBY+EOVn/RmY3HrbwCV7o4
         OCsWgSd30Vh/XAVQlVm9u+QTSootjlftCYGZXR1G/hrW6TZCbKzamiTgWiRQBsxIaEzf
         T2pnUUMJOHNBZ7yZbkWzsAjZyqZWT9S9t87MCLD9TomH8nqiELwasbIPM0RApbL/dF+v
         9ZpOj5hPqbvJwPIQ7qxeVjns298VPKNaMk/mmyyOAJyexGIcdP6JtT5adI7CRCKIls3E
         egGeBWFAIdCIDa9n4FH7tTB2ujPNtLv3KvxRq4GK51VbkXt7qlkg65UfM2qNhyRGeDsh
         bFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994489; x=1792599289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=;
        b=NfW8lcrq1PifY4eNsZQQPlXrWNNzMyP/hOi22glqkgz0ilZTKKzgOGZadnl4K9jKnv
         pO9i67FX7EPetFcgpJNQVgaIfPtoDUgOF9lsFDAQPUM66TlrojwQ2ogt0bWycLcnwJ/c
         E56yIiuIN3mwla8YEkWuAo5RqKaFIJMLUt22n45QZKrKQWezicrabsVxAYx2IHa1RL2c
         ugTzWP5jBCNLmfsGhZU0n9+GwMvwKSb3BCnQLCi7+QiBJ1AdEo8oqQpQSmufNF1ms5Ag
         RLyv+DjYT1ov4LyvzkW37zg4GgGQyJyd0KC5nNsm3zTewrDO/wjUJnbLTIA1PrEEDpIP
         eKkA==
X-Forwarded-Encrypted: i=1; AKwUvBwz/ns5Uqog4n9uOEbB9xatuj2h3GoLfjjhdRB9spv0QD04RPF7Of2m+oPIQa+sD7mPyRsh/Tj9Iiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJitn505cRR2fQAY4iNvwDenKzNPj9jx/MuNbWsAeyjfXMpxmyM
	1+wEt7rSekWP29ZTOIhkBodVfS64PtTaL0wgw1S9b9H2LxKVA8W2V4jZJ1IAiE+awNEwWKNubyb
	IOiCzzR7QTm2YJuWL1jWYCbVGntEKK/Rzn65fhHWEY3H2zHnlffA51UQ4CPBMfZE=
X-Gm-Gg: AYBFou1Z8CO6ZmTqu/MKyXtjOj86ulloikSgEj9zccate/ge0ecos8LDn7CxogF1nS/
	iqux7UEcqsEsX+UNwS8/WnlXaWdvNflOsVoLTedg5WN6Ig5qvLsVPaZosEQxnLKBmmilSqSPXtF
	ufX4Lhh3tLwTMgJXIE/YCEhlYsDiqL3S+1hm0yg4QStp+jLnBaVM0s6Zg4GVFn0ZJqh7nllG8u8
	cX6Wo/QsfErqiJyEP3H3KYIe4pTOqMM0gaegKxj0GPNrl4CUnurRIdEHjBPmfa5vULL2OlqBIDj
	ohQI/O3ntuZkDKIyvcINGd0rDE7hmNs1/u8qF0mlTx9NrG3bBDAjEqhQV2S3z+OrN9HsVk+ikSG
	4pFcARwV2U5aWCNR8LUwptg==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2745453285a.5.1791994488900;
        Wed, 14 Oct 2026 09:14:48 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2745441985a.5.1791994488098;
        Wed, 14 Oct 2026 09:14:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043cbfsm2141866b.55.2026.10.14.09.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:14:47 -0700 (PDT)
Message-ID: <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfXzdhSYjqZAorZ
 yRwZuBmu4HtHYHobzmbHwe1Xvi2J3U+5Zx9cytz4QZNEkJnRRySOK1O/yIKnkN8w+hqlrBfhvA2
 GUlppWwepZZbRlfP24XTOjHfYD1YmtQ=
X-Proofpoint-GUID: wkNeUOnNq7cOeTMZ4AQDVWfDjzy4yNJ6
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfaa7a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tSyx0q1tghd3iirTVWYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX81D04Fhnfwdp
 FKpSFfMcI1bjqmXBaP3dZHoMhWn/HlLWzeT6W5M7INFMbPKT3GIcJjdjaF7qI83prLVnzZAtBnH
 T0FGgrTDo4pPaoSvpg40TPrDJeuFnccFcGIwHNQbmfjKkvX+4XMeb265bdOh3+Z5NzuJjaKAqgI
 VkCnO6vW06aotF2CSNnqeT1l75I7JDAb3OfJZF01hpNj7swIQAn5wC58jpr3Mq+zephavX983nQ
 S2uynquLiLm9nO7DcP1rXLd+XMnohMHXGLqWKcpXuN+bfeVBL3icUaD5hj7g84oxZhlurBlvjGc
 EDQi4f9wgV5Purgu3AdpAsShoNG3xSxoD0fleeIIWCSGkUMZdG/QGUdbiIrrvMg3/KuS+KvKHSr
 YDHW0hR6s4+tRnK/FmWWOvEqNaE94JHh3wyNgE7QZdmMatLJg6CHqSvHmzSvl7RYtBqpk2Hgfx4
 6SEjvUdQGCPL6voIfqQ==
X-Proofpoint-ORIG-GUID: wkNeUOnNq7cOeTMZ4AQDVWfDjzy4yNJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> A failed OPP transition need not leave the clock at the last successful
>> OPP's frequency. If hardware changed before the error, the default
>> single-clock path can subsequently skip a necessary retry because its
> 
> What is a necessary retry? Shouldn't it be: try, rollback if it fails?

The failure scenario is:

opp-table {
	opp-400000000 {
		// low
	};

	opp-1000000000 {
		// high
	};
}';

1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
2. A driver requests High.
- OPP raises the voltage to 0.95 V.
- clk_set_rate(..., 1 GHz) changes the clock, but returns an error
- Assume clk_get_rate() can report the resulting 1 GHz rate.
3. The transition returns an error, so current_opp still points to Low.
4. The caller tries to recover by requesting Low again.

Perhaps I should have included that in the commit message.

Konrad
