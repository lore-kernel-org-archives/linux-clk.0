Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AE122D4E2
	for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785604; cv=none; b=mH8AHH6qMAXlo/PeeYAGI+LId97+FTErk3kb4HFaT2Mf6pohOAK5pf7eHtjQTvH42KnyA3G6LvDYIbWVoxaj6zyyvfaNP7fbqveQ3zvXaBNMUWRNR1RVQ3JaJn03rpPwXRpkXMrXt+NJ7jdGgAEH/DJtObPTA7SsFVEyylIbAhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785604; c=relaxed/simple;
	bh=pRm5rikPg836Cpaht6T2Bti6G/gsdEEiL/oreW2ehWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NZzR4kpG3woCyhCkIRPcKBdqWh4m40oO9aUqfCoBE3qeeDd6clJ7aOJZA4vGUy6VG37whSZgLlfmZ3zH2W/k5Veg/35m/h9iPvvf+THc2dBuehOE6nt6TtTtaDSuYMQ4iKiSUFf5D21VHS5XN1Krnc1zKxfi3qGYH+pxk/X82/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhrTT8/m; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhrTT8/m"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2295d78b45cso90447815ad.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744785602; x=1745390402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=JhrTT8/m6kO4m1EAju7eGEsIHuUpRJFWF1FdOvfrMlmY8vdAC0MKW92hpOqLqIeD3u
         C91iwFkVxT9dlwB7IPoQiEch9vxGD9JZwTpKADUy542/ZXjDrR80cTQ+QtYbjH4Cvi3k
         ZT5pqaH/w+rTipU32vW7bx5E5gP1WqRpDNi1+7KTzkCo5OjtcsQYsD09bBal5lgmVyIV
         RNGSuguuqi/ASd1VOp/wdEzjEC4/eENq0TaSJjXJUmIm59x+6VS7c7CMVTqJE1Zzalbs
         xHoZkCoyF6S01/ZP4kCq+S+vBViL2B6fngMgXJOBTcqF4UclE9+fnanYGihsQazr3qeG
         q9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785602; x=1745390402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaMUD1BDVL417dtmG3+/1YWJeUCWl78+KVSs+NX3TJI=;
        b=avpz+RvCK1e1JJ7mofkHmOResX5bPB3xfBhBgDSwTLHGBKdUnmL7WYSbMoxv6r3Tqs
         cRPiFC39rof6c/tWycvUaTvvYKF9F42yu7c8yk1gNERgcTaWT3w+3Rfg/MXq0FvA1Zkp
         wbeXa1KTritJYvDu7AMkzHgGcmVfElyxJezq/XTKwHLxP8eplKimwfEFYeOTNgUHddOX
         hZeTpOr1FPxhDUoJ+OoQjbL9EVdb0iPbtAEULkiBcvd+maIxY5HeTo+k1FAB/oDsV0Nj
         l/H4XHwletvWd/AriU8uQ/MHlRVVu2koyLowFHwQZ29WuEqNLoQmq9Prmg2wzcd05r2F
         k7cw==
X-Forwarded-Encrypted: i=1; AJvYcCW1/7/ljrZscgk3vkJPklUpwU63b9Q8n+XgLsD3+X4FYyfvtn5ZrPuU5nFBb782ggKu9xriueLZkos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJHwfJ6zMBNAxy6cAyaFfAnfXtwR1hd1/T2C6Dud9AIKHUUxu
	8WdC1l1OXkDeQurTz0LsMYnIKFF5QHvyidrjQCLQ6zfZsSX4PE/BC/ne9dYI3NM=
X-Gm-Gg: ASbGnctM9B1L9vq79MJINZQ52hkt4GGAHoxgbnn/XJGIZD5W75VwWLKr5Mm20/fgADL
	7QfDzzou7IwpgyEfnJehQGuyREbqKWEBUKZyt+CeDaYa2L7zA0nSuCA2tlgc36nBuCAfqq2lJxk
	fKa9IU/EFA+N4hbZx7q3V2+3MLORdkm4pdI7BgBcOpraOHZ7IF6P3cSZkZjBDXaouAhy+ts3Wcf
	NFEre8CuSyhSisjliqLr/EFZH2/hw+N38KA+gb9AZ3aMo6krQxzywCypAhcH1dw74DffIoWlJ9a
	uWu8xVZ9Ey/jZVUdR2VYrMwcbmfv5riJXhAYOLoKFw==
X-Google-Smtp-Source: AGHT+IEZ0BjxMEufYyWXS1DlCdKaeRakmruSioO3vp2nVRyRnB2tMQN8Qlo8XDozRJzOoVI66wZ2Yw==
X-Received: by 2002:a17:903:1aaf:b0:224:1781:a947 with SMTP id d9443c01a7336-22c358de2cdmr12563915ad.21.1744785602483;
        Tue, 15 Apr 2025 23:40:02 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d3cbsm6459055ad.97.2025.04.15.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 23:40:02 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 03/15] MAINTAINERS: Add entry for Rust cpumask API
Date: Wed, 16 Apr 2025 12:09:20 +0530
Message-Id: <9115c43e4eae9fd958344e7befc945e0e649a6c5.1744783509.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744783509.git.viresh.kumar@linaro.org>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MAINTAINERS file to include the Rust abstractions for cpumask
API.

Yury has indicated that he does not wish to maintain the Rust code but
would like to be listed as a reviewer.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..bd7c54af4fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6237,6 +6237,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
 
+CPUMASK API [RUST]
+M:	Viresh Kumar <viresh.kumar@linaro.org>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/cpumask.rs
+
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-- 
2.31.1.272.g89b43f80a514

