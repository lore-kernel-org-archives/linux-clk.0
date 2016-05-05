Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
To: Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>
References: <1460900051-3065-1-git-send-email-digetx@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <69a8cb7c-0821-a6d2-607b-7d9a0ac057d2@gmail.com>
Date: Thu, 5 May 2016 14:45:31 +0300
MIME-Version: 1.0
In-Reply-To: <1460900051-3065-1-git-send-email-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I forgot to mention that this is observed on 3.18 android kernel fork under a 
quite specific condition: EMC scaling enabled and set to the lowest freq, CPU 
max freq reduced. This may cause higher latency on CPU idle enter/exit.

I couldn't reproduce this issue with the upstream kernel, guess some specific 
workload is also required. Any comments? =)

-- 
Dmitry
