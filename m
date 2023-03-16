Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C2BC74A5B
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 22:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjCPWYP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 18:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjCPWX6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 18:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96331B691D
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679005321;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/Rowjv41usgCF4QQ+kI7SHFbssbiYFWw5qAQUMEZc44=;
        b=SHTJpmtP4QCzXpF5Y+3qkm4FZKqpslAx6ZFqZzdJ8mDo8xHCtwoxouiiE4Ft11u8rJMvix
        n75o9cITMTcYjst1fBRDjhUnDZQqPuhtXFl7iLpCqS5ktT3mDV0ekbxIK4EMRBEfApqSRU
        KD2ovTrz7VWMuJ0OslHV9MELp667acg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-4-yTVDeCPq-mzSE7Wpu-8A-1; Thu, 16 Mar 2023 18:22:00 -0400
X-MC-Unique: 4-yTVDeCPq-mzSE7Wpu-8A-1
Received: by mail-ot1-f70.google.com with SMTP id cm26-20020a056830651a00b006983a82ef15so1381375otb.18
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 15:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679005319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Rowjv41usgCF4QQ+kI7SHFbssbiYFWw5qAQUMEZc44=;
        b=NoGtWYJafq/HftvNpax0T0WhMMMCoLt+eb5yZNbMlUb84zl415vTI06m0+YIhOQDUV
         VhrdcKIgSHDl/kQgvSWhbduOtxU5+oVDcjmIFiYGHE2ZXasfjVGc11iMvzfggUS99Usr
         YAgJwoNDyCrGHIt0qjs87W/K0QbOd3vm9mW3SIPA2PqlZRU4Ra2sDPtvfhTLTkd30QRD
         Y1E1XhQ4JlZ4O2SxHlMHivKAbyumFP/T1W/5qODZdKa0FZU6nYiD9D6gbyVKgaxz5kSK
         vBebKODwuXur+q/xwRaDDQ4xsdDylRBsS3PVlwcwIBEXwBcTlJfvciRAgRSez4P9OnE+
         /lnw==
X-Gm-Message-State: AO0yUKXE0wL9gUjYH/PnxDjRGifs7nuqXQk5uRhCS6kI9JZK3gPCBbCG
        VwFeSFNn8vVn97L3jTyZ9gpCIUSnP9i3IRBDoDtw4COpyNaWh7O503E0lmuowCcOd4201GnEc4k
        6ueDDU+uHPPhVQZXxbAQ+
X-Received: by 2002:a05:6808:288e:b0:37f:ab79:a18a with SMTP id eu14-20020a056808288e00b0037fab79a18amr3573044oib.6.1679005319344;
        Thu, 16 Mar 2023 15:21:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set/j+kh5lDpmaLzdIllCWV+e60+QESfodsxPJwbhNxsMnnYpD889YVRRc7aq7J3P6t24SdXMeg==
X-Received: by 2002:a05:6808:288e:b0:37f:ab79:a18a with SMTP id eu14-20020a056808288e00b0037fab79a18amr3572986oib.6.1679005317656;
        Thu, 16 Mar 2023 15:21:57 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id r130-20020acaf388000000b00383f58e7e95sm245725oih.17.2023.03.16.15.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 15:21:56 -0700 (PDT)
Date:   Thu, 16 Mar 2023 17:21:53 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com
Subject: Re: [PATCH net-next 05/11] clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
Message-ID: <20230316222153.43wzb4nv7s4d3wwz@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-6-ahalaney@redhat.com>
 <3f37eede-6d62-fb92-9cff-b308de333ebd@linaro.org>
 <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314160818.2yopv6yeczne7gfi@halaney-x13s>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 14, 2023 at 11:08:18AM -0500, Andrew Halaney wrote:
> On Tue, Mar 14, 2023 at 04:13:18PM +0100, Konrad Dybcio wrote:
> > 
> > 
> > On 13.03.2023 17:56, Andrew Halaney wrote:
> > > Add the EMAC GDSCs to allow the EMAC hardware to be enabled.
> > > 
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > ---
> > Was it tested to not cause issues on access on "normal" 8280xp?
> > AFAICS if there would be any, they would happen at registration
> > time, as gdsc_init already accesses its registers
> 
> No, I've only tested this series on the sa8540p-ride. I luckily also am
> working from an x13s, I will use that to confirm nothing strange happens
> with this applied before sending v2 and confirm the results.
> 

Writing from my x13s with this applied, things seem ok to me :)

Thanks,
Andrew

