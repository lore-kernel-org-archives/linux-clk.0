Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484410;
	b=aNKVbqGaPjHF0uEqmbAtNStdS8iBiQ1XwFN2QgHIn+VcfpK3DvQA1P97mHIHrW4GiT2n
	 O9OVBOTd+4l/Yh3qzP8leHUy0iQrpECs1Wi1CRwEyuVwKm3pTWdzDD8QteQHw3fiVPL8R
	 6RzLrvViUGGb7rY7FdwBJ0XhPC0HfhnGB9mtPX6jOtS/k+zO0ThhMs/dqBj44kN0Xpy22
	 j8nRIFVkfE7D2EFEqBiWtnAlPYJD4U4r+OifXXspBmXRPg7LZdvXpqFSuF2hvgZ3fpMqc
	 oav+uBKTi92p8Jq6Ps5VBLZiZcS5rfAK7lkGa+EO+sHRPHnty1Y0AuMBEUZJlDZn6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=;
	b=zQhcTlZJcTquP7aALre6goAev2nJPFZhH5W9wDHSrdW/A0Em+LIKhEIH80MgPPg70c7y
	 Ovju1CIOWrimRcwEUxxqVrlLsoRH7vx2ZJ4RUCdjJjdbuQ7HzWF40e/FcNC9cH9Qtekww
	 Ec0EP0B6UQnpPsFh8nI2uMVuUJfaAzrCjaK87yTOnkRpD+55i4JYJgDpGIv6wy2JhjJvX
	 QuVw//5+q4wdGVmgzgCoBqJXX+rNMrGF4l0Y1GgPhNKJ/A4rMs3BXuPsKvBolSCEd6Khy
	 I3pRYt6Jek6k+qR581ni1sotT239lY5SHMxLaAqdGCpcMwbFzqJc+mK/uqfrwKIO1FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8SMxe8m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnEvb5UQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259A606A31E
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6259A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8SMxe8m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnEvb5UQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tJ7p4031765
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=; b=L8SMxe8mPeqC1GjA
	XVf85Z6x4XUkNQHaWNO8+AyZezgTB8WJ86GYC4iAKV5VR+ZvE0YR0tfNUrsHYLB9
	PDhZWsrBvHPKLK/bthpZmxJHP3+21f7dI4mOLKKwoVcMkTquxUOoMCJevv2r7jwB
	q8OVOLSDX4dis2sZDZmnGizOgsUUUQnBGOVBagZQnFDq8p7eeLyA5f0UyvFTwb3x
	2kLuZHAzU6ErHdCaLQJ6VhAyCL4AsukoBU+yBcPpS7y7Ab/0D4tYevCChtVPoI7A
	tr/tB6I4g8X/GVTEw9bW9l+X3Nqc+zUMPeWemo86RRlvM5uM6eI3gsTfFTRm7v0c
	3P1U2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9j4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:20:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso707902485a.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484408; x=1793089208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=;
        b=bnEvb5UQxRa45RbUOibJv/K23h5f31Q0qNcNOQPdQj93rgimu6gI+eA306PBhsLpdt
         rscg/+s3iRH82QZFntkmLxGO4epDSqFATZIboes3HqSoZQXswAen6u15NZbqTkeZnnYn
         CVLfS4FyC24p/Egwcu0vJg2v/+E7SSKHiIR0p86nFXIMcqHBDp9Q5ve2JtgCoCma8ukp
         95ghLUaMVISenKfmpk53uuz2ifzKrkt4EytBjzXfFbcqkrcnpNYRHGqi/F3aiRqPSp3l
         L3VyYEb3vnvSQypYth/OvsGxlWdoTxxxXH8dZhYLBtU+2MFVwoijFZly/RoeA795Hzrq
         PjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484408; x=1793089208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqxObPJ4qCr+tpFRrLBJEM3JoxynDOvIQyi41scKzgQ=;
        b=YQKSp2y/eEvjEpL6SAxXYGLLYyPlhsWMZ34r0qS4yGeUE4qqM5AMc8eIFBWzkSJdQH
         EOsUe6RRtirZ9JTww7/qtMFSUdPcmQGYbew7fJBzNCjVM7o6AwHI4ruk83ym3HTKPXpv
         9wLEghegL6Ey+65m8XzGM35fnzVvPQQbhvFNy3JNfNM9AmWaZv/YbPGKA1IGz6d3J1Fk
         +MFLelibUzCDon9UX1VCWEMpDXUsdWi5BC9KaRtF/ZLZgFrwCSCEhqoqTzLJ+skfQGtk
         dAg0JT0+PVn2uwyCMm8pm0Ro935p4alr2cWgxHKPfSPsJRsm0smG0kt8gYDCqSz9ka9C
         Sg8Q==
X-Forwarded-Encrypted: i=1; AKwUvByMNh4hcQgUrnUtzN8kKwOQiSCQVlkiNf7WDOoU4hvU1rOFf8jwhyrg07RaijCyIx0gpNTIABCrcSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxPMb/TJzVfXWWpR+xrEZ76voV9PWPXL1C45NXHebR771VtvfB
	q4/jzujvRde6nQlCqJqpEM5Nw7I3lB1lXLX+VRlTEuFBh7PN4W6lMhCDxtv2/RNz4Oye3NoF/46
	K4+GWvgK71T8tEfESWPWnsO6e+k/ZGKj0FiI/ZOJMgmMpxXvZXhzcH6usZcuOCBA=
X-Gm-Gg: AYBFou1Yu5DmLh62RT1Rj/qu+SJeTYetq7Arcb6Roazh1UcpB1+QRUytjQ9dgF4pTJ6
	d4SWGLpqXgo6heONt2xYLDYt+ic4JqmfCHZN4cDItacq+l94BKNw8SX0AGhlTmcljNWagKU0Gxu
	dWEaYD0ttErH2MGmvdqLGfJ56Z3KINSvFlKeQB1IcUa5ddVB1ugZ0ucHAxJYm7zEmg3K+hkEvvD
	BadnieyAUxaalGiyRXB09i1nqpehPmwO44lNBUU+9K7fUcykYSV16zBEeVkGz9FVXhHTszxmvxj
	+8/lO0ADiWdCoT9YdH/s/70Tru0R7oKSEx8eXTXMypGzLrkGUKnP7EJXy+j0/Ok538Hhav/HdBD
	dil1CD+qEQVr7AW4uoEM4uor/e3umHVo=
X-Received: by 2002:a05:620a:2989:b0:937:6de8:b40 with SMTP id af79cd13be357-93f29ceec65mr1712839485a.15.1792484407533;
        Tue, 20 Oct 2026 01:20:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:937:6de8:b40 with SMTP id af79cd13be357-93f29ceec65mr1712835285a.15.1792484406890;
        Tue, 20 Oct 2026 01:20:06 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f3833f93sm28793665e9.3.2026.10.20.01.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:20:05 -0700 (PDT)
Message-ID: <75a64aa8-cc9a-492f-9f49-008c9f34f280@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:20:02 +0300
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: camcc-sm8250: use icc-clk for camera
 NoC AXI clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
 <g56qnvvcuvih7pm2lhkppvpbj6squhwyi6sfvahw4zvuqitrkj@mewzkeerabm7>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <g56qnvvcuvih7pm2lhkppvpbj6squhwyi6sfvahw4zvuqitrkj@mewzkeerabm7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0k8A3ciEf45-PcgJy37B04Kq5G_23OZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX7Twk4pLY/FHF
 Upx69LMjN8VUjDrvv0jeBB+1BUmuGodQUibRPOUvIDa6qEsruNnPm5RF0hyJCcuGNh9RH2xYGtY
 O3DHQT4gHPEuCfhSnnWra1cRs27Snxexyv11idzhO9HyYvRFlmpOadv0ZrmqU/efHjkp6nprLSR
 c/iOLZvxs+ksJIKweEjSgefqAMIGLdTL2J7wOXbm9vqvo56q1KvklX7s/q6i0Ih8xdFz9LfNokk
 1Ep/KFczNTZuSJzg+xGq0e+xnIkdT/XGr2E7Kywdp+ttN7ySNTe1mrKEqjtFi+R65ilDTxm3ky0
 nie7k2T/w/UPc6W/ygaNfrSwdG/Lh0GJf34boGZ+nLzy7qY15O3gg8kDeNaxIhK6b+Xedgyytxt
 3TubZK2D7Rxu4kXrdbAgcn0wLvYHFofCNGU1/1pCT2PM52VDNY5qMsDvXvqgcEd8NdwifrdTWJu
 g3f7vbuNyDVhiUF6JxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX2WU/MbbGWhMU
 ZcRB3fBWATXc6BudZqZ1EUfNj25AP3miU0cFg6ZqD4QUtDNrPYM4DtaXjV0QPuYVMapwZfSxkrJ
 cxInY6Zr3TR85c80+fpci3U2ktUGr1E=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad72438 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KSjN1H3_7EXrvi_VFQkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0k8A3ciEf45-PcgJy37B04Kq5G_23OZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200033

On 10/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 16, 2026 at 08:07:00PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
>> rate directly from each consumer means the last writer wins.
>>
>> Register the clock as an icc-clk path through the common icc_hws
>> support, as gcc-ipq9574 does. The interconnect core aggregates all
>> requests and the clock runs at the highest requested rate.
>>
>> Use the RCG rather than the branch: icc-clk enables the clock at
>> registration, when TITAN_TOP_GDSC is still off. Consumers enable the
>> branch themselves.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/camcc-sm8250.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
> 
> This is a nice approach. Several quesitons: if there are multiple
> clients, should the clock track the max of the rates a sum of the rates?

Max. icc-clk sets the clock from the aggregated peak bandwidth, and
icc_std_aggregate() takes the maximum of the peak requests. Each client
asks for the bandwidth it needs, so the highest request covers all of
them. A sum would overestimate the clock.

> Also, this clock needs a certain level on a rail. Are you going to add
> the opp table to the clock controller or to the devices which use the
> ICC?
> 
To the devices. Each consumer describes its own needs in its OPP
table: every entry carries the core clock rate, the camera NoC
bandwidth and the required rail level, and dev_pm_opp_set_opp()
applies all of them at once. Dropping the OPP on idle removes the
votes. For example, the JPEG encoder (to be posted separately):

         interconnects = <&camcc MASTER_CAMCC_CAMNOC_AXI
                          &camcc SLAVE_CAMCC_CAMNOC_AXI>;
         interconnect-names = "camnoc";
         operating-points-v2 = <&jpeg_opp_table>;

         jpeg_opp_table: opp-table {
                 compatible = "operating-points-v2";

                 opp-100000000 {
                         opp-hz = /bits/ 64 <100000000>;
                         opp-peak-kBps = <25000>;
                         required-opps = <&rpmhpd_opp_min_svs>;
                 };
                 ...
                 opp-600000000 {
                         opp-hz = /bits/ 64 <600000000>;
                         opp-peak-kBps = <400000>;
                         required-opps = <&rpmhpd_opp_turbo>;
                 };
         };

The consumer asks for the bandwidth it needs, independent of how many
rate levels the camera NoC clock has on a given platform; icc-clk
rounds the request to a rate the clock supports.

Best regards,
Atanas
