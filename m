Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C81EC43334
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 06:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242106AbiFUGZj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 02:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345471AbiFUGZf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 02:25:35 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A383E18E23
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 23:25:30 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220621062525euoutp01d64fc444961573504d1949d7c76b94db~6jrYK6vKK1159511595euoutp01c
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 06:25:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220621062525euoutp01d64fc444961573504d1949d7c76b94db~6jrYK6vKK1159511595euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1655792725;
        bh=2M7VrybOVemCI84SREzv/nQfzD8PLsxPY9hkSljilfw=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=Ytdosr9hHAatWFWr0+AarxHbDtLx2tSu3oHpJItD7uQfT62OgryrY/3DHo0brvB0K
         9K+pxsBHEpRhnkXkn4ZVbfvUhxkmeLwBbgmZ8X8ObcFok28OFXhznGMBSmvs8QQ2oD
         HDZwfzsB79Whtcn6wRKiz8m1mLm0IVpFnK/Bqg+w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220621062525eucas1p206d47a3f677a6c25d08c1c086de60a48~6jrX3AzMN2170121701eucas1p2c;
        Tue, 21 Jun 2022 06:25:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.98.10067.55461B26; Tue, 21
        Jun 2022 07:25:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220621062524eucas1p163b1c93486dd407ac49bef26a9372554~6jrXgydPW2976529765eucas1p1P;
        Tue, 21 Jun 2022 06:25:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220621062524eusmtrp2814b93abd9430123effca46d1978f6e8~6jrXf2JtK1457314573eusmtrp2j;
        Tue, 21 Jun 2022 06:25:24 +0000 (GMT)
X-AuditID: cbfec7f4-dc1ff70000002753-c4-62b164553eb7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D9.CD.09038.45461B26; Tue, 21
        Jun 2022 07:25:24 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220621062524eusmtip1936e2ffaa8a9a78436233d30f2c89dc8~6jrW63KFL0178601786eusmtip1s;
        Tue, 21 Jun 2022 06:25:24 +0000 (GMT)
Message-ID: <5ebb4585-90fa-02b5-a49c-dc81fce7285a@samsung.com>
Date:   Tue, 21 Jun 2022 08:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] clk: Fix pointer casting to prevent oops in
 devm_clk_release()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-clk@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUwTURSFfZ1pOwULz0Hlpi5o3aJGNk0YI6lLhDTGqNEgajQ6hQmgQLVl
        kx+KS4lWTAUlaE0ElwQyolBQFKJG64JFEcpSiWJdooIgKkJExLq048K/c+89X869L48i6Ati
        BZWQnMLpktlEpcSLrLo32DAnKtaiCS51SpnsjqnMi728iOFPOyQMn19NMr05TjFjzb+OGHtd
        BPPDYSGZp7lH0SKZutlhJ9Qf2wxSNV99kVDvv9MjVlfwByVqkytY3VcxcZV0g1d4LJeYkMbp
        glRbvOJvfTFLtz+TZ1ga8skslOttRDIK8DxwHuoijciLonEJgj5Lh1go+hHU778vFYo+BB/t
        LeRf5O3tPJEwKEaQz9uQUPQieHOn8zdCUXKsgu+FC90AiafB1+ZuDyzHo8B24rVHj8EaKKwy
        iN3aD0dB9dlzyK0J7A9PXhd6AkZjEwJTTqUngMCdCG7wRRK3S4JDwNhj9GgZjoAcW8sfOgD2
        XT5JuAHAXyk43uDwbAR4KbR9ChZO8IOu2ktSQY+Hn9XuNLdFC67jc4V2Bji6SwlBL4D2R98k
        bguBZ0JZTZDQXgzOa09IgfSBtp5RwgI+kFdVQAhtORzIpgX3dDDXXvyXeauxiTiClOZhj2Ie
        drx52Cnm/7lFiOSRP5eqT4rj9KHJXHqgnk3SpybHBcZokyrQ7x/14Edt/1VU3NUbaEUiClkR
        UIRytDzcu1xDy2PZnZmcTrtZl5rI6a1oHEUq/eUxCeUsjePYFG4bx23ndH+nIkqmyBJNmF9q
        r1pT93aXKmxFAf/FkTYSR/uF3euYcTRvU39m5DIFd/OYdvxA5mHNgKumeUZtiMG+c90IxePT
        TaYld9dWfns+MMSfMfHPDza5Ijcpw12VHQ8/TKN3NxTxMqNl48brth1P572kz714GFp5zXuX
        7l1xxM0pnwsljvrykpmTopYbvFVbxnWSez4hic/5wVbfgbJoWvW+kW1Nm93q29++PiZ9ZdkY
        K4qCSZGT67VFirGvYPBVYnx24xDJBam6I6c65ys/LIsbmhIKNRlnA9btSX/3BjSntkbrUq4Y
        VjC3S9pbbLlU1gWaC/BNRZfCaFb7QFv38v5eovPq6sP672YlqY9nQ2YROj37C2Htxx7AAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7ohKRuTDC4+1rNoe65i8aBpFZPF
        qoXX2CxWTd3JYvGx5x6rxaGpexktLp5ytfh3bSOLxe2JkxkdOD0uX7vI7PH+Riu7x6qd65g9
        Wo68ZfXYtKqTzaP/r4HH501yAexRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
        pkr6djYpqTmZZalF+nYJehkHv81iL7jLW7Hx/FSWBsaJ3F2MnBwSAiYSzw5PYupi5OIQEljK
        KPHt1x02iISMxMlpDawQtrDEn2tdYHEhgfeMEp9O83YxcnDwCthJ/JlvDxJmEVCV+HH5NQuI
        zSsgKHFy5hMwW1QgSWLe3tWMILawQKjEzsVLwGxmAXGJW0/mg+0VEehnlPh99BSYwyzwglHi
        wdx97BAXnWWUmDZ9PjtIC5uAoUTXW4grOAVcJXpOXoEaZSbRtbULypaXaN46m3kCo9AsJJfM
        QrJxFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMzG3Hfm7Zwbjy1Ue9Q4xM
        HIyHGCU4mJVEeG24NyQJ8aYkVlalFuXHF5XmpBYfYjQFBsdEZinR5HxgasgriTc0MzA1NDGz
        NDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamCa+G3l6bNCJ0Miyn9uetUa36DQU9fY
        vPU9Y7Wi0x2THVsuPo4otK1vlTvzz8fa19Jn67U/4l28//i6l91ebN13K4clNk/++8esyusZ
        Bzsc/IJMBWY2hRz+F+HZ2vKxu/6GptzrI2wf419mVRktz3azr/v3qX2nyq7L5zWPTFL32nn6
        /N6zfiU8ZlqLvirb3Fx3L4x9R9r/vpK6RbP1D3w+zGIs2OgQtDEx5KakcqGG/ZYTswV7e2wk
        zNbPX3r/acDhd25XObcdyVNkbGqLlTic/tHlO/NCHt39vH1Hej/xBmdwaCS7iy3Z99d5ukjZ
        lXObQtPuLXN7pJ1s9zz4q5KKD2s025ZdR6uKu0y2eCqxFGckGmoxFxUnAgDvfc92VQMAAA==
X-CMS-MailID: 20220621062524eucas1p163b1c93486dd407ac49bef26a9372554
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220620171854eucas1p2702e46ab21fd706d9c1d1c76f68e0d38
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220620171854eucas1p2702e46ab21fd706d9c1d1c76f68e0d38
References: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com>
        <CGME20220620171854eucas1p2702e46ab21fd706d9c1d1c76f68e0d38@eucas1p2.samsung.com>
        <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20.06.2022 19:18, Uwe Kleine-König wrote:
> The release function is called with a pointer to the memory returned by
> devres_alloc(). I was confused about that by the code before the
> generalization that used a struct clk **ptr.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> On Mon, Jun 20, 2022 at 05:26:12PM +0200, Marek Szyprowski wrote:
>>> -   clk_put(*(struct clk **)res);
>>> +   struct devm_clk_state *state = *(struct devm_clk_state **)res;
>> This should be:
>>
>> struct devm_clk_state *state = res;
>>
>> otherwise it nukes badly during cleanup:
>> [...]
> How embarrassing. I understood how I confused that, but I wonder how
> that didn't pop up earlier.
>
> FTR: I didn't test that now, but assume you did. My focus now was to get
> out an applicable patch fast.
>
> Thanks for your report
> Uwe
>
>   drivers/clk/clk-devres.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index c822f4ef1584..1bb086695051 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -11,7 +11,7 @@ struct devm_clk_state {
>   
>   static void devm_clk_release(struct device *dev, void *res)
>   {
> -	struct devm_clk_state *state = *(struct devm_clk_state **)res;
> +	struct devm_clk_state *state = res;
>   
>   	if (state->exit)
>   		state->exit(state->clk);
>
> base-commit: abae8e57e49aa75f6db76aa866c775721523908f

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

