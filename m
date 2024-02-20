Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606360DE7
	for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708424009; cv=none; b=KC2LyEfcLjgMTP3Z8f+bAgmGV1KtKvWFoAV9C5OQ4TpbvdTOR0j7Jdwd2NV6L2MaqYQYRxwwJeBbETqWQg20Vy6s+bdiiPCF4Cp7kpBPS/ov4w58miCbJslS54i21LN23RRgPDAbh3iYuJy5C9dI10FsMLEzmFHiCcP++c703e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708424009; c=relaxed/simple;
	bh=3zQrjayHU0zR7acw/SjTS8KiZbIQ05hoQsyTblW3SCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxvBG/XAvs6rXhvFbVjxyRW51WeJ9nFbbVVhkXa+pG/0scqdf4aifkO6pU1T2gD3qMIeZ3n9orwHmn8laGNXsLVrPNlGoUIo62LALsyb2rgE2kik7PUs2E4kzJROg0AEhn2VdhV3padIj0s5QZbs4tHVkPY7wzkTt4UcriPfj9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xv+gZx0D; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xv+gZx0D"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3e8c1e4aa7so204699566b.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708424006; x=1709028806; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7dQHtCCgCaMBqIA4LdD55Zh7E2b6Y8hIW3g0h8uCcg=;
        b=xv+gZx0D16JfmGuK9HrM8IBb+lgI/U/q1hplDa/VM0LHawEHtfN7H8+dGH2507qGOP
         A1eHbFt0tjTS1VrjExwcMbOZAd958kCuyVy4CxXU6MoFQpK3ibkm7BXsOXyxOT30XkhL
         ML+zME0s8qIlbFnJygKk85hRNzWouMT4MVap2y/6tFFgdqj2ryqyfnVwE7mNrsI6vHJi
         B2Oj9PxM7YnOwYrd9Xz8RhwKADgPmQa3TfqoDf6Y7sbfO6aziLVedQjjwqUWGwp4AAm8
         gdwEHV5P/zHqhvuD/iiu2TPq/xI688mueSaMwAn2Bh/7+8JKbuBn4mTY3N+wfWzAhfcZ
         A6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708424006; x=1709028806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7dQHtCCgCaMBqIA4LdD55Zh7E2b6Y8hIW3g0h8uCcg=;
        b=OLkNNWbes7KYyJfdkICL7K18TDG4IYukW26kWq37j0pAdCf91xZPseEo/l2Zo9t6or
         yvIKd2D6vq29K+mq2+B39cOb+zoZ4benKqCk7S0A4TB+ADqBXBUXATIFGcNkaCJNxQyO
         EgwUHY7mx6AxW/qPWoHFoHBMZOaEg7z6Ma4Q9UzzbNWMJSf3+Tx8XKhRjWoHSmhgXcFd
         UEhuaxbJzOUjc/fb2embpzrwQUqYT6yBGSqo5ksMex1i/g1kRBMy9Wj9IDMKCtruNjRi
         0vDC9Z4GDh0ZmMvWIN3WqVe3AuAXcTUt3a4w0wchVM8apv9zwalKXpKOYGgEgylMZWFH
         AU1A==
X-Gm-Message-State: AOJu0Yx9A+HcraekoTUM3OBja+ZgKCAVUvOG3jwzkPmWqDMA0Se0ti9Z
	V0lkXTssQmnpqpcWokMYX0UoPtUZ0ihHAlz+8iscNCuMBt3JRNw02lCR73Ng/IU=
X-Google-Smtp-Source: AGHT+IE/NZ3zXzkm0vCXQLMrj4CgMrQojWHx0zCGBNphBfQk4mEallM7ury9uKyPqKHsELWgu/r6Qg==
X-Received: by 2002:a17:906:2b4a:b0:a3e:89b6:34fd with SMTP id b10-20020a1709062b4a00b00a3e89b634fdmr3913366ejg.32.1708424005745;
        Tue, 20 Feb 2024 02:13:25 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id th8-20020a1709078e0800b00a3d3b68e504sm3752387ejc.202.2024.02.20.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 02:13:25 -0800 (PST)
Date: Tue, 20 Feb 2024 13:13:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: cristian.marussi@arm.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: scmi: Allocate CLK operations dynamically
Message-ID: <904dd0c0-cbe4-47e0-a475-9f5352c7eb5c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Cristian Marussi,

The patch 11f5b1a48a70: "clk: scmi: Allocate CLK operations
dynamically" from Feb 14, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/clk/clk-scmi.c:362 scmi_clocks_probe()
	error: uninitialized symbol 'atomic_threshold'.

drivers/clk/clk-scmi.c
    307 static int scmi_clocks_probe(struct scmi_device *sdev)
    308 {
    309         int idx, count, err;
    310         unsigned int atomic_threshold;
    311         bool is_atomic;
    312         struct clk_hw **hws;
    313         struct clk_hw_onecell_data *clk_data;
    314         struct device *dev = &sdev->dev;
    315         struct device_node *np = dev->of_node;
    316         const struct scmi_handle *handle = sdev->handle;
    317         struct scmi_protocol_handle *ph;
    318 
    319         if (!handle)
    320                 return -ENODEV;
    321 
    322         scmi_proto_clk_ops =
    323                 handle->devm_protocol_get(sdev, SCMI_PROTOCOL_CLOCK, &ph);
    324         if (IS_ERR(scmi_proto_clk_ops))
    325                 return PTR_ERR(scmi_proto_clk_ops);
    326 
    327         count = scmi_proto_clk_ops->count_get(ph);
    328         if (count < 0) {
    329                 dev_err(dev, "%pOFn: invalid clock output count\n", np);
    330                 return -EINVAL;
    331         }
    332 
    333         clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
    334                                 GFP_KERNEL);
    335         if (!clk_data)
    336                 return -ENOMEM;
    337 
    338         clk_data->num = count;
    339         hws = clk_data->hws;
    340 
    341         is_atomic = handle->is_transport_atomic(handle, &atomic_threshold);

atomic_threshold is not initialized when is_atomic is false.

    342 
    343         for (idx = 0; idx < count; idx++) {
    344                 struct scmi_clk *sclk;
    345                 const struct clk_ops *scmi_ops;
    346 
    347                 sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
    348                 if (!sclk)
    349                         return -ENOMEM;
    350 
    351                 sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
    352                 if (!sclk->info) {
    353                         dev_dbg(dev, "invalid clock info for idx %d\n", idx);
    354                         devm_kfree(dev, sclk);
    355                         continue;
    356                 }
    357 
    358                 sclk->id = idx;
    359                 sclk->ph = ph;
    360                 sclk->dev = dev;
    361 
--> 362                 scmi_ops = scmi_clk_ops_alloc(sclk, is_atomic, atomic_threshold);
                                                            ^^^^^^^^^^ ^^^^^^^^^^^^^^^^
Here we're passing uninitialized data, but it's only used when
is_atomic is true.  This is okay if scmi_clk_ops_alloc() is inlined,
but it is considered a bug when it's not inlined.

    363                 if (!scmi_ops)
    364                         return -ENOMEM;
    365 
    366                 /* Initialize clock parent data. */
    367                 if (sclk->info->num_parents > 0) {
    368                         sclk->parent_data = devm_kcalloc(dev, sclk->info->num_parents,
    369                                                          sizeof(*sclk->parent_data), GFP_KERNEL);
    370                         if (!sclk->parent_data)
    371                                 return -ENOMEM;
    372 
    373                         for (int i = 0; i < sclk->info->num_parents; i++) {
    374                                 sclk->parent_data[i].index = sclk->info->parents[i];
    375                                 sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
    376                         }
    377                 }
    378 
    379                 err = scmi_clk_ops_init(dev, sclk, scmi_ops);
    380                 if (err) {
    381                         dev_err(dev, "failed to register clock %d\n", idx);
    382                         devm_kfree(dev, sclk->parent_data);
    383                         devm_kfree(dev, scmi_ops);
    384                         devm_kfree(dev, sclk);
    385                         hws[idx] = NULL;
    386                 } else {
    387                         dev_dbg(dev, "Registered clock:%s%s\n",
    388                                 sclk->info->name,
    389                                 scmi_ops->enable ? " (atomic ops)" : "");
    390                         hws[idx] = &sclk->hw;
    391                 }
    392         }
    393 
    394         return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
    395                                            clk_data);
    396 }

regards,
dan carpenter
