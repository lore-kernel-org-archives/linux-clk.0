Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26722A4C9
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742579634; cv=none; b=dGuak9kaPqCTPd5CIGXPpUQ69UhDAuLgeWmMGjcBI42W0jpf8jPV/DP9jw4qziUyeULnIL0ZluWhpNdTn9UosZF/mmTREDLi/vbdo2/lE4Lm/nLAzHleEc0iaVnBqTlsptD/RroJx6xCbEty5NYU14euwnj4iB4S5hoZedk/hVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742579634; c=relaxed/simple;
	bh=cHCUYkglDqNg2FuGOj+/CWfW4NUnhGwmo8XW8BumtK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NhyYxuMkvjEeaCYfgAyLOO3nIVe2uoYh1gSahdcGA0NIt2juPJS56bE2w3wnxL4ogN1+dEMhd4E+6PNaqwHZNiqiCbLcgD+EPUvOXK20t92b4kT80y+JjtY2z6ugX4o+1YE68ZOzMZOJFmdIE4c01me+TNDQ2Mm2qnSixwA/AIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JSWPP1OW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JSWPP1OW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391342fc1f6so1879291f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742579630; x=1743184430; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=;
        b=JSWPP1OWCNSwL1+HWtEt3dmKEMwn5sER+T7MQKrdL+7FljOVciFGa/bTdSJppAJlA4
         YUCTgi+a/calz1yyGPf6O6n7kLNddubdEc4Fe4mUW8ckFG0EOpjx7RTs/GE3kQo30vus
         bp46qCPAfLGLPs+wk8qNP1NKx2L01EBC3LhZ8Wg3fJVkb6r5X5oR310xdF3msC6QV6w9
         k3RxTmMTeVnYx1MOE/jH4M0CQRMhYfxXkD3NdguAao/Q9TcdAmftIxRCckaOMC+h0liY
         5PxQerQtfG0htkFdBR76T7mmpwJHsVHp7fIYIlftlYy8RzLMOpxAwU5xz+G45R7TJ6Hi
         VoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742579630; x=1743184430;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNqD8PyJLQnJQLvnULZ+vanw9dMkZAzGyI1k4rO3/oY=;
        b=g1/we4ZHVh+PLLVuq9UgVWAMfT4FBdeBilMdKovQvXsLkVyyk44ye6xEfDtlf3DR6m
         WXF9IsGWV0/+Ha1TT+Q+6NGeKZcw4hxg1R+Xv7Td1lMVM5QG2WlgGSjBmSOIRUCYFll3
         7yuLAXdOQDysF2fwA0tY9cHI2AZ6d9Dyzll4mMiUZOUti0jvYvMIZw62Rd4TPBu1tkjp
         YJZEn4UNKzyn3MzBicHUJp62mw3i2TCHUNQtAhJWaqkYrM4SedRj1KcVkHjZSjmHAjdZ
         WwG4SovHjVSoLo2VyGmeQVDgZ4ePB9FbzjrBNL6DSabGQPXQf3YBxAepCckN+TF0yN38
         YZxg==
X-Forwarded-Encrypted: i=1; AJvYcCXOkJBNZUFEgW3BwYNFZGDX3hFlrktVORG+Ob61qNWS066EC/dKBvgtmGyg3sNrqWlFicRVlYV1inA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJo2eBq892fD+SBbSPyFuMBzDo1sLx+yfr/CdDU14oM1k0XR8
	hNGrx1RngaVl2nsKTNE0tGugg/3rVa6/MMUNbUBMuLNwnd4s3KRmHi/cn7t4Su8=
X-Gm-Gg: ASbGnctl9uq+SvoddgMdyXgeqw5LuL0tSm4Oj71iDz65wzmqwAliITqeOlH+d1+TsUo
	BZmBrYjONzdxgAqNcywcrRMdL6yXhc/sWaBQjli4FtaB6hAb/UYWkMjedphCuhJfSxVln71/WfH
	44H0WFu5GAJOKBvg2OymDukDpAL/TzDXo3iOyF2LL1vb7Qz6MfWr/s+K+bzJpyQgHXlHFo4xbfy
	VPPm/s2BdcrVH0EbpxnTNW/nmEnz5Io5EYI4kjPwihV6aBNpOSnpqGF7s89TJY66Y5P8F0v8Qr2
	unfLz0ZsKl96tn+zrzteyQOt3RpKFKpqRQ2p4i68XIgI
X-Google-Smtp-Source: AGHT+IGw/k1s3UhG3nO2rFtVFyriyvE9zSGonoM40r54Hxa67x+rs2qU6DUJGZCT59Otrl8jKGhlwA==
X-Received: by 2002:a5d:6482:0:b0:391:2da8:6e26 with SMTP id ffacd0b85a97d-3997f94083fmr4523621f8f.52.1742579630502;
        Fri, 21 Mar 2025 10:53:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c5a7:dfd4:9ad8:1ea0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9a31a7sm2929623f8f.23.2025.03.21.10.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:53:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock
 device or device_node
In-Reply-To: <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 26 Feb 2025 17:01:05 -0800")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	<20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com>
	<508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 18:53:49 +0100
Message-ID: <1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:


>> +static void clk_hw_get_of_node_test(struct kunit *test)
>> +{
>> +       struct device_node *np;
>> +       struct clk_hw *hw;
>> +
>> +       hw = kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
>> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
>> +
>> +       np = of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
>> +       hw->init = CLK_HW_INIT_NO_PARENT("test_get_of_node",
>> +                                        &clk_dummy_rate_ops, 0);
>> +       of_node_put_kunit(test, np);
>> +
>> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
>
> The stuff before the expectation should likely go to the init function.
> Or it can use the genparams stuff so we can set some struct members to
> indicate if the pointer should be NULL or not and then twist through the
> code a couple times.
>

I'm trying to address all your comments but I'm starting to wonder if
this isn't going a bit too far ? The functions tested are one line
returns. Is it really worth all this ?

I do understand the idea for things that actually do something, such as
reparenting, setting rates or what not ... But this ? It feels like a
lot of test code for very little added value, don't you think ?

-- 
Jerome
